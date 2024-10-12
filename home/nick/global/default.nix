{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../features/utils/starship
  ];

  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "24.05";
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

  programs.home-manager.enable = true;
}
