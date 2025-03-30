# nixos-configuration

This is my current NixOS configuration.

## Features

-   NixOS flake that configures the system
-   home-manager configuration that manages dotfiles

![Screenshot of my desktop](/imgs/desktop.png)

My current setup configures Hyprland and installs a couple helpful utilities. See them below:

<details>

<summary>Utilities</summary>

| Type                | Program        |
| ------------------- | -------------- |
| Window manager      | Hyprland       |
| Top bar & shell     | AGS            |
| Display Editor      | nwg-displays   |
| Polkit              | lxqt-policykit |
| Screenshots         | Grim/Slurp     |
| Volume control      | Pavucontrol    |
| File manager        | pcmanfm        |
| Image viewer/editor | gwenview       |
| Document viewer     | Okular         |
| Calculator          | kcalc          |
| Media player        | VLC            |

</details>

## Machines

-   `ntthinkpad` : Main laptop | 40GB ram, Ryzen 7 7730U, 2TB SSD
-   _Main desktop will be added soon_

## Installation

Clone the repository:

```bash
git clone https://github.com/ntenebruso/nixos-config ~/.dotfiles
```

`cd` into `.dotfiles`:

```bash
cd ~/.dotfiles
```

Installing the system:

```bash
sudo nixos-rebuild boot --flake .
```

Installing user configuration:

```bash
home-manager switch --flake .
```
