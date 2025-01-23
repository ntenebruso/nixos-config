{
  ...
}:

{
  imports = [
    ./global
    # ./features/desktop/hyprland
    ./features/desktop/gnome
    ./features/groups/productivity.nix
    ./features/programs/intellij
  ];

  home.stateVersion = "24.05";
}
