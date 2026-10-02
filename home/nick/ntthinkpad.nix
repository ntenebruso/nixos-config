{
  ...
}:

{
  imports = [
    ./global
    # ./features/desktop/hyprland
    ./features/desktop/gnome
    # ./features/desktop/sway
    # ./features/desktop/kde
    ./features/groups/productivity.nix
    ./features/groups/school.nix
    ./features/groups/games.nix
    # ./features/programs/intellij
    ./features/programs/neovim
    ./features/programs/tmux
    ./features/programs/yazi
  ];

  home.stateVersion = "24.05";
}
