{
  ...
}:

{
  imports = [
    ./global
    ./features/desktop/hyprland
    # ./features/desktop/gnome
    # ./features/desktop/kde
    ./features/groups/productivity.nix
    ./features/programs/intellij
    ./features/programs/neovim
  ];

  home.stateVersion = "24.05";
}
