{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      apps
      battery
      hyprland
      mpris
      network
      notifd
      tray
      wireplumber
    ];
  };

  xdg.configFile."ags" = {
    source = ./config;
    recursive = true;
  };
}
