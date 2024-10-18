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

      search.default = "Google";
      search.force = true;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        bitwarden
      ];
      extraConfig = builtins.readFile ./user.js;
    };
  };
}
