{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.java.enable = true;

  home.packages = with pkgs; [
    (jetbrains.idea-ultimate.override {
      jdk = pkgs.jdk;
    })
  ];
}
