{ pkgs, pkgs-unstable, config, ... }:

{
  xdg.configFile."rofi" = {
    source = ./rofi_files;
    recursive = true;
  };
}
