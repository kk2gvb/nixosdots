{ pkgs, pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      clang-tools
      pyright
      ruff
      nixd
      alejandra
      lua-language-server

      ripgrep
      fd
      gcc
      gnumake
    ];
  };

  # xdg.configFile."nvim".source = ./nvim;
}
