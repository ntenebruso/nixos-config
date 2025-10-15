{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    logisim-evolution # Logisim Evolution
  ];
}
