{
  pkgs,
  config,
  lib,
  ...
}:

{
  users.users.nick = {
    isNormalUser = true;
    description = "Nick Tenebruso";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # put packages here
    ];
    initialPassword = "nick";
    shell = pkgs.zsh;
  };
}