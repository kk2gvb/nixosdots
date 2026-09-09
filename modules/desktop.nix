{ pkgs, ... }:

{
  # WMs
  # programs.niri.enable = true;
  # programs.dms-shell.enable = true; # comment it if u want to use noctalia
  # hydenix = {
  #   enable = true; # enable hydenix - required, default false
  #   hostname = "nixos"; # hostname
  #   timezone = "Asia/Yekaterinburg"; # timezone
  #   locale = "en_EN.UTF-8"; # locale
  #   # hm.enable = true;
  # };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
}
