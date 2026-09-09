{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.hydenix.homeModules.default
  ];
  # home.stateVersion = lib.mkForce "26.05";
  hydenix.hm = {
    enable = true;
    fastfetch.enable = false;
    gtk.enable = false;
    qt.enable = false;
  };
  #   enable = true;
  #
  #   hyprland = {
  #     enable = true;
  #     animations.enable = true;
  #   };
  #
  #   hyde = {
  #     enable = true;
  #   };
  #
  #   # theme = {
  #   #   activate = "Catppuccin Mocha";
  #   # };
  #
  #   rofi.enable = true;
  #   fastfetch.enable = true;
  #   shell = {
  #     enable = true;
  #     zsh.enable = true;
  #     starship.enable = true;
  #   };
  #
  # };
  # hydenix = {
  #   enable = true; # enable hydenix - required, default false
  #   hostname = "nixos"; # hostname
  #   timezone = "Asia/Yekaterinburg"; # timezone
  #   locale = "en_EN.UTF-8"; # locale
  #   hm.enable = true;
  # };
}
