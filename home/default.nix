{ lib, config, pkgs, pkgs-unstable, user, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDir;
  home.stateVersion = "26.05";

  imports = [
    ./packages.nix

    ./scripts/scripts.nix

    ./programs/git.nix
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/neovim.nix
    ./programs/fastfetch.nix
    ./programs/stylix.nix
    ./programs/dunst.nix
    ./programs/rofi.nix
    ./programs/vscodium.nix

    # ./desktop/niri.nix
    # ./desktop/hyprland.nix
    ./desktop/noctalia.nix
    # ./desktop/hyde.nix
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
}
