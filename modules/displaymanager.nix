{ pkgs, ... }:

{
  # DM
  services.displayManager = {
    enable = true;
    sddm.enable = true;
  };
}
