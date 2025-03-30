{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  programs.firefox = {
    enable = true;

    profiles."nick" = {
      isDefault = true;

      search.default = "google";
      search.force = true;
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        bitwarden
        tabliss
      ];
      extraConfig = builtins.readFile ./user.js;
    };
  };
}
