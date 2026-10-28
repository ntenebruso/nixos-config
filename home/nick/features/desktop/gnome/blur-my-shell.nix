# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/blur-my-shell" = {
      pipelines = "{'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'dual_kawase_blur'>, 'id': <'effect_23becccf-d0fa-40d3-9cd7-ae594398a6b5'>, 'params': <@a{sv} {}>}>]>}, 'pipeline_default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'dual_kawase_blur'>, 'id': <'effect_49891092116929'>, 'params': <{'unscaled_radius': <30>, 'brightness': <0.59999999999999998>}>}>]>}, 'pipeline_695f1744-32ea-4f54-97c6-f47c1577498f': {'name': <'Liquid Glass'>, 'effects': <[<{'type': <'refraction'>, 'id': <'effect_873fe4f4-dba1-475a-a411-a81133ebaac6'>, 'params': <{'blur_radius': <20>, 'edge_size': <22>, 'falloff': <2.3999999999999999>, 'tint': <0.20000000000000001>, 'tint_color': <(1.0, 1.0, 1.0, 1.0)>, 'strength': <1>}>}>]>}}";
      rounded-blur-found = false;
      settings-version = 7;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      pipeline = "pipeline_695f1744-32ea-4f54-97c6-f47c1577498f";
      static-blur = false;
      style-dash-to-dock = 3;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
      corner-radius = 0;
      override-background = true;
      pipeline = "pipeline_default";
      static-blur = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/popup" = {
      pipeline = "pipeline_695f1744-32ea-4f54-97c6-f47c1577498f";
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      pipeline = "pipeline_default";
    };

  };
}
