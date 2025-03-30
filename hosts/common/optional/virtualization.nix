{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    virtiofsd
  ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
}
