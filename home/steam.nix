{ pkgs, pkgs-unstable, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Открывает порты для Steam Remote Play
    dedicatedServer.openFirewall = true; # Открывает порты для локальных серверов
    localNetworkGameTransfers.openFirewall = true; # Для быстрой передачи игр по локальной сети
  };

  programs.gamemode.enable = true;
}
