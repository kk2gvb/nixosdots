{ pkgs, pkgs-unstable, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = { type = "small"; };
      modules = [ "title" "os" "host" "kernel" "uptime" "packages" "shell" "wm" "terminal" "cpu" "gpu" "memory" ];
    };
  };
}
