{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.thunderbird = {
    enable = true;
    profiles.nick = {
      isDefault = true;
    };
  };
}
