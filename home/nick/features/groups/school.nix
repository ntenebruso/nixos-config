{
  config,
  pkgs,
  lib,
  ...
}:

{
  nixpkgs.config.permittedInsecurePackages = [
    "firefox-esr-140-bin-unwrapped-140.17.0esr"
  ];

  home.packages = with pkgs; [
    logisim-evolution 	# Logisim Evolution
    zotero		# Research
  ];

  # RClone to sync GDrive
  programs.rclone.enable = true;
}
