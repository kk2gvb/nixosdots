{ pkgs, user, ... }:

{
  # USER
  users.users.${user.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ];
    shell = pkgs.zsh;
  };
}
