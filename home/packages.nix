{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    # for niri
    # pkgs-unstable.dms-shell

    # ICONS
    pkgs.papirus-icon-theme

    # BROWSERS
    pkgs.chromium
    pkgs-unstable.librewolf
    pkgs-unstable.tor-browser

    # CHATTING
    pkgs-unstable.telegram-desktop
    pkgs-unstable.element-desktop
    pkgs.discord-ptb

    # TORRENT
    pkgs-unstable.qbittorrent
    
    # utils
    pkgs.wev

    # OFFICE
    pkgs.libreoffice
    pkgs.gimp
    pkgs.obs-studio
    pkgs.keepassxc
    pkgs.nomacs
    pkgs.obsidian

    # TERMINAL
    # pkgs-unstable.alacritty
    pkgs-unstable.kitty

    # CODING STUFF
    # pkgs-unstable.vscodium
    # pkgs-unstable.neovim

    # C / C++
    pkgs-unstable.gcc
    # pkgs-unstable.clang
    pkgs-unstable.clang-tools
    pkgs-unstable.gdb
    pkgs-unstable.gnumake
    pkgs-unstable.cmake
    pkgs-unstable.ninja
    pkgs-unstable.valgrind

    # Python
    pkgs-unstable.python3
    pkgs-unstable.python3Packages.pip
    # (pkgs-unstable.python3.withPackages (ps: with ps; [
    #   pip
    #   ipython
    # ]))

    # CLI UTILITIES
    pkgs-unstable.btop
    pkgs-unstable.htop
    pkgs-unstable.fastfetch
    pkgs-unstable.tree
    pkgs-unstable.zip
    pkgs-unstable.unzip
    pkgs-unstable.imagemagick

    # OTHER UTILITIES
    pkgs.grim
    pkgs.nautilus
    pkgs.slurp
    pkgs.hyprshot
    pkgs.hyprpicker
    pkgs.swaybg
    pkgs.awww
    # pkgs.waybar
    pkgs.rofi
    pkgs.wofi
    pkgs.wlogout
    pkgs.wl-clipboard
    pkgs.pavucontrol
    # pkgs.helvum
    pkgs.qpwgraph
    pkgs.zathura
    # pkgs.fzf

    pkgs.qt6.qtbase
    pkgs.qt5.qtbase
    pkgs.qt6.qtwayland

    # LaTeX
    pkgs.texmaker
    pkgs.texstudio
    (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-full; })

    # GAMING
    pkgs-unstable.protonup-qt
    
    # music
    pkgs.yandex-music

    # codex
    pkgs.codex
  ];
}
