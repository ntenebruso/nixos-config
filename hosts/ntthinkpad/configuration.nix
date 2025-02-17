# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Users
      ./../common/users/nick

      # Common system
      ./../common/global

      # Login manager
      # ./../common/optional/sddm.nix

      # TLP
      ./../common/optional/tlp.nix

      # Hyprland
      # ./../common/optional/hyprland.nix

      # GNOME
      # ./../common/optional/gnome.nix

      # KDE
      ./../common/optional/kde.nix

      # Virtualization
      ./../common/optional/virtualization.nix

      # Docker
      ./../common/optional/docker.nix

      # Flatpak
      ./../common/optional/flatpak.nix

      # GPG
      ./../common/optional/gpg.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ntthinkpad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.firewall.enable = true;

  # Power key
  services.logind.powerKey = "suspend";
  services.logind.powerKeyLongPress = "poweroff";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
