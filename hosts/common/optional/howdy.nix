{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.howdy = {
    enable = true;
    control = "sufficient";
  };

  security.pam.services.sudo.howdy.enable = false;
}
