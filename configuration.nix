{ config, lib, pkgs, user, ... }:


{
  nixpkgs.config.allowUnfree = true;
  
  imports =
    [
      ./hardware-configuration.nix

      # ./disko.nix

      ./modules/boot.nix
      ./modules/hardware.nix

      ./modules/virtualization.nix

      ./modules/network.nix
      ./modules/time.nix
      ./modules/env.nix
      ./modules/audio.nix
      ./modules/bluetooth.nix
      ./modules/desktop.nix
      ./modules/displaymanager.nix
      ./modules/user-configuration.nix
      ./modules/programs.nix
      ./modules/fonts.nix
    ];

    
  # ADDING FLAKES SUPPORT
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_7_1;

  # HOSTNAME
  networking.hostName = "nixos";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    ntfs3g
    xwayland-satellite

    libxcb
    libxcb-cursor
    xcb-util-cursor
    qt5.qtbase
    qt6.qtbase
    qt6.qtwayland
    amnezia-vpn
    zapret
  ];

  system.stateVersion = "26.05";
}

