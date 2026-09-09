{ pkgs, ... }:

{
  # for base wayland support
  services.xserver.enable = true;
  # enable wayland
  programs.xwayland.enable = true;

  # ENV
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # QT_QPA_PLATFORM = "wayland";
  };
}
