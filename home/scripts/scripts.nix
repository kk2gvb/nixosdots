{ pkgs, config, ... }:

let
  change-brightness = pkgs.writeShellApplication {
    name = "change-brightness";
    runtimeInputs = with pkgs; [
      brightnessctl
      dunst
      coreutils
    ];
    text = ''
      get_brightness() {
          brightness=$(brightnessctl get)
          max_brightness=$(brightnessctl max)
          percent=$(( brightness * 100 / max_brightness ))
          echo "$percent%"
      }

      increase_brightness() {
          brightnessctl set +5% > /dev/null
          brightness=$(brightnessctl get)
          max_brightness=$(brightnessctl max)
          current_brightness=$(( brightness * 100 / max_brightness ))
          dunstify -u low -r 69 -h "int:value:$current_brightness" "Яркость: $current_brightness%"
      }

      decrease_brightness() {
          brightnessctl set 5%- > /dev/null
          brightness=$(brightnessctl get)
          max_brightness=$(brightnessctl max)
          current_brightness=$(( brightness * 100 / max_brightness ))
          dunstify -u low -r 69 -h "int:value:$current_brightness" "Яркость: $current_brightness%"
      }

      case "''${1:-}" in
        --get) get_brightness ;;
        --up) increase_brightness ;;
        --down) decrease_brightness ;;
        *) get_brightness ;;
      esac
    '';
  };

  change-volume = pkgs.writeShellApplication {
    name = "change-volume";
    runtimeInputs = with pkgs; [
      pulseaudio # содержит pactl
      dunst
      gawk
      gnugrep
      gnused
    ];
    text = ''
      if ! pactl info &>/dev/null; then
          echo "PulseAudio/Pipewire не запущен!"
          exit 1
      fi

      get_volume() {
          pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}' | grep -o '[0-9]*%' | tr -d '%' | head -n1
      }

      get_mute() {
          pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
      }

      show_notification() {
          vol=$(get_volume)
          mute=$(get_mute)
          if [ "$mute" = "yes" ]; then
              dunstify -u low -r 68 "Звук выключен (Mute)"
          else
              dunstify -u low -r 68 -h "int:value:$vol" "Громкость: $vol%"
          fi
      }

      volume_up() {
          current=$(get_volume)
          if [ "$current" -lt 150 ]; then
              pactl set-sink-volume @DEFAULT_SINK@ +5%
          else
              pactl set-sink-volume @DEFAULT_SINK@ 150%
          fi
          show_notification
      }

      volume_down() {
          pactl set-sink-volume @DEFAULT_SINK@ -5%
          show_notification
      }

      toggle_mute() {
          pactl set-sink-mute @DEFAULT_SINK@ toggle
          show_notification
      }

      case "''${1:-}" in
        --up) volume_up ;;
        --down) volume_down ;;
        --toggle) toggle_mute ;;
        --get) get_volume ;;
        *) echo "Использование: $0 [--up|--down|--toggle|--get]" ;;
      esac
    '';
  };

  wallpaper-selector = pkgs.writeShellApplication {
    name = "wallpaper-picker";
    runtimeInputs = with pkgs; [
      imagemagick
      rofi
      awww
      libnotify
      findutils
      coreutils
    ];
    text = ''
      WALL_DIR="${config.home.homeDirectory}/Wallpapers"
      CACHE_DIR="${config.home.homeDirectory}/.cache/niri/wallpapers"
      ROFI_CONFIG="${config.home.homeDirectory}/.config/rofi/wallSelect.rasi"

      mkdir -p "''${CACHE_DIR}"

      if [ -d "$WALL_DIR" ]; then
          for imagen in "$WALL_DIR"/*.{jpg,jpeg,png,webp}; do
              if [ -f "$imagen" ]; then
                  nombre_archivo=$(basename "$imagen")
                  if [ ! -f "''${CACHE_DIR}/''${nombre_archivo}" ]; then
                      magick "$imagen" -thumbnail 300x300^ -gravity center -extent 300x300 "''${CACHE_DIR}/''${nombre_archivo}"
                  fi
              fi
          done
      fi

      ROFI_CMD="rofi -dmenu"
      if [ -f "$ROFI_CONFIG" ]; then
          ROFI_CMD="rofi -dmenu -theme $ROFI_CONFIG"
      fi

      SELECTED=$(find "''${WALL_DIR}" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do
          echo -en "$A\x00icon\x1f''${CACHE_DIR}/''${A}\n"
      done | $ROFI_CMD -p "Выберите обои")

      if [ -z "$SELECTED" ]; then
          exit 0
      fi

      SELECTED_WALLPAPER="$WALL_DIR/$SELECTED"

      if [ ! -f "$SELECTED_WALLPAPER" ]; then
          exit 1
      fi

      awww img "$SELECTED_WALLPAPER" --transition-type outer --transition-pos 0.8,0.2 --transition-duration 2.0
      notify-send "Reload Wallpapers" "Successfully updated: $SELECTED"
    '';
  };

  powermenu = pkgs.writeShellApplication {
    name = "session-menu";
    runtimeInputs = with pkgs; [
      rofi
      systemd
      procps
    ];
    text = ''
      choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -p "Сессия")
      case "$choice" in
        Lock) loginctl lock-session ;;
        Logout) pkill -KILL -u "$USER" ;;
        Suspend) systemctl suspend ;;
        Reboot) systemctl reboot ;;
        Shutdown) systemctl poweroff ;;
      esac
    '';
  };

in
{
  home.packages = [
    change-volume
    change-brightness
    wallpaper-selector
    powermenu
  ];
}
