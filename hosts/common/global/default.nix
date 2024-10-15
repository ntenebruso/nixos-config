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
    home-manager
  ];

  # Install zsh
  programs.zsh.enable = true;

  # Install vim
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;

  # Install neovim
  programs.neovim.enable = true;

  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}

