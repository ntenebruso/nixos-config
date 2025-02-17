{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.java.enable = true;

  home.packages = with pkgs; [
    jetbrains.idea-ultimate
  ];

  nixpkgs.overlays = [
    (final: prev: {
      lldb = prev.lldb.overrideAttrs {
       dontCheckForBrokenSymlinks = true;
      };
    })
  ];
}
