{
  ...
}:

{
  imports = [
    ./global
    # ./features/desktop/hyprland
    # ./features/desktop/gnome
    ./features/desktop/sway
    # ./features/desktop/kde
    ./features/groups/productivity.nix
    ./features/groups/school.nix
    # ./features/programs/intellij
    ./features/programs/neovim
    ./features/programs/tmux
  ];

  home.stateVersion = "24.05";
}
