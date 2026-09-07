{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    bubblewrap # sandbox agents
    (pkgs.writeShellScriptBin "opencode-sandbox" (builtins.readFile ./sandbox.sh))
  ];

  programs.opencode = {
    enable = true;
  };
}
