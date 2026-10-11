{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    logisim-evolution 	# Logisim Evolution
    # zotero		# Research
  ];

  # RClone to sync GDrive
  programs.rclone.enable = true;
}
