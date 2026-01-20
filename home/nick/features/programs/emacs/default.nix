{
  config,
  pkgs,
  lib,
  ...
}:

{
#  services.emacs = {
#    enable = true;
#    package = pkgs.emacs-pgtk;
#  };
  home.packages = with pkgs; [
    emacs-pgtk
  ];
}

