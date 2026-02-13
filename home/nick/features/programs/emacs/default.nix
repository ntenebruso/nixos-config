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
#  home.packages = with pkgs; [
#    emacs-pgtk
#  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };
}

