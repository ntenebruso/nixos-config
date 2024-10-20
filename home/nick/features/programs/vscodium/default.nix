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
    extensions = with pkgs.vscode-extensions; [
      # General use
      vscodevim.vim
      pkief.material-icon-theme

      # Web dev
      esbenp.prettier-vscode
      bradlc.vscode-tailwindcss
      astro-build.astro-vscode
      vue.volar
      svelte.svelte-vscode

      # Python support
      ms-python.python
      ms-python.pylint
      ms-python.black-formatter
    ];
    userSettings = {
      "editor.fontFamily" = "\"JetBrainsMono Nerd Font Mono\", monospace";
      "prettier.tabWidth" = 4;
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
