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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = with pkgs; [
      # put packages here
    ];
    initialPassword = "nick";
    createHome = true;
    shell = pkgs.zsh;
  };
}
