{
  config,
  pkgs,
  lib,
  ...
}:

{
  # All my productivity-related packages for desktop
  imports = [
    ./../programs/firefox
    ./../programs/emacs
    ./../programs/vscodium
    ./../programs/thunderbird
    ./../programs/opencode
  ];

  home.packages = with pkgs; [
    libreoffice # Editing suite
    veracrypt # Disk encryption
    keepassxc # Password management
    texliveFull # LaTeX
    python3Packages.pygments # Pygments for minted
    element-desktop # Element
    zettlr # markdown
    obs-studio # video + screen recording
    qbittorrent # torrenting
    # sdrpp # SDR software
    ungoogled-chromium # backup chromium
  ];
}
