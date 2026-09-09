{ pkgs, pkgs-unstable, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];

      theme = "apple";
    };

    shellAliases = {
      nixup = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#nixos";

      nixupdate = "nix flake update && sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#nixos";

      nix-clean = "sudo nix-collect-garbage --delete-old";

      nix-test = "sudo nixos-rebuild test --flake ~/nixos-dotfiles/#nixos";
    };
  };
}
