{ pkgs, pkgs-unstable, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
