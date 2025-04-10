{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports =
    [
      ./bluetooth.nix
      ./cups.nix
      ./locale.nix
      ./networking.nix
      ./pipewire.nix
    ];


  # Required system packages
  environment.systemPackages = with pkgs; [
    wget
    git
    gcc
    cmake
    gnumake
    home-manager
  ];

  # Filesystems management
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Install zsh
  programs.zsh.enable = true;

  # Install vim
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;

  # Nix LD
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
#  nix.settings.access-tokens = "${builtins.readFile /var/secrets/tokens}";
}

