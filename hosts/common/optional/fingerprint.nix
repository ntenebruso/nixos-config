{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
  };

  security.pam = {
    services.sudo = {
      fprintAuth = false;
    };
  };
}
