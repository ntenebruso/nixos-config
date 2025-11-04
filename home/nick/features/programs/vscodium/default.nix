{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # General use
        vscodevim.vim
        pkief.material-icon-theme

        # Web dev
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        #astro-build.astro-vscode
        vue.volar
        svelte.svelte-vscode

        # Golang
        golang.go

        # Python support
        ms-python.python
        ms-python.pylint
        ms-python.black-formatter

        # LaTeX
        james-yu.latex-workshop

        # Rust
        rust-lang.rust-analyzer

        # Direnv
        mkhl.direnv
      ];
      userSettings = {
        "prettier.tabWidth" = 4;
        "editor.formatOnSave" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
      };
    };
  };

  xdg.desktopEntries.vscodium-wayland = {
    name = "VSCodium (Wayland)";
    exec = "codium --ozone-platform=wayland %U";
  };
}
