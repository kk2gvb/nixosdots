{ pkgs, pkgs-unstable, config, ... }:

{
  xdg.configFile."niri/config.kdl" = {
    source = ./niri/config.kdl;
  };

  xdg.configFile."niri/dms" = {
    source = ./niri/dms;
    recursive = true;
  };

  xdg.configFile."scripts-niri" = {
    source = ./scripts-niri;
    recursive = true;
    executable = true;
  };
}
