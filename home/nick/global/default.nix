{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../features/utils/starship
    ./../features/themes/fonts.nix
    ./../features/scripts
    ./../features/utils/direnv
  ];

  home = {
    username = "nick";
    homeDirectory = "/home/nick";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      sysrebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
      usrrebuild = "home-manager switch --flake ~/.dotfiles/";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };

  programs.home-manager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
