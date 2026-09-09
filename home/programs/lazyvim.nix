{ pkgs, pkgs-unstable, ... }:

{
  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;
      lang.python.enable = true;
      lang.clang.enable = true;
    };

    # Additional packages (optional)
    extraPackages = with pkgs; [
      nixd       # Nix LSP
      alejandra  # Nix formatter
    ];
  };
}
