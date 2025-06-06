{
  lib,
  config,
  ...
}:

let
  mainWaybarConfig = {
    layer = "top";
    position = "top";

    modules-left = [
      "hyprland/workspaces"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "battery"
    ];

    "hyprland/workspaces" = {
      disable-scroll = true;
      format = "{name}";
    };

    clock = {
      format = "{:%H:%M}";
      tooltip = false;
    };

    battery = {
      interval = 60;
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon} {capacity}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
      max-length = 25;
    };
  };

  css = with config.lib.stylix.colors.withHashtag; ''
        * {
          font-size: 20px;
    	    font-family: ${config.stylix.fonts.monospace.name};
        }

        window#waybar {
    	    background: ${base01};
    	    color: ${base04};
          padding: 1px 0;
        }

        #battery {
          padding: 0 6px;
        }

        #clock {
          padding: 0 6px;
          border-radius: 8px;
          background: ${base00};
        }

        #workspaces {
          padding: 0 6px;
          background-color: ${base01};
        }

        #workspaces button {
          padding: 0 2px;
          color: ${base04};
          border-radius: 8px;
        }

        #workspaces button.visible {
    	    background-color: ${base02};
        }

        #workspaces button.active {
    	    background-color: ${base04};
          color: ${base00};
        }
  '';
in
{
  options.specialConfig.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf config.specialConfig.waybar.enable {
    stylix.targets.waybar.enable = false;
    programs.waybar = {
      enable = true;
      style = css;
      settings.mainBar = mainWaybarConfig;
    };
  };
}
