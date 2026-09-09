{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;

    # image = ./wallpaper.png; 

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono; # pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    targets = {
      waybar.enable = false;
      rofi.enable = false;
      dunst.enable = false;
      alacritty.enable = false;
      vscodium.enable = false;
    };
  };
}
