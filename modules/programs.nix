{ pkgs, ... }:

{
  # PROGRAMS
  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true; # Optional: enables SSH agent support
  };

  programs.gamemode.enable = true;

  programs.zsh.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
    tunMode.setuid = true;

    };

}
