{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable CUPS
  services.printing.enable = true;

  # Avahi
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
