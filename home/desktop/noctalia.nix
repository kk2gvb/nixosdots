{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "catppuccin";
      };

      wallpaper = {
        enabled = true;
        default.path = "${config.home.homeDirectory}/Wallpappers/";
      };
    };

  };
}
