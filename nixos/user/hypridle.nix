{ config, pkgs, lib, ... }:

{
  options = {
    hypridle.enable = lib.mkEnableOption "enables hypridle with custom config";
  };

  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 60; # Screen dim at 1 min
            on-timeout = "brightnessctl --save && brightnessctl -e4 -n2 set 10%-";
            on-resume = "brightnessctl --restore";
          }
          {
            timeout = 300; # Screen off at 5 minutes
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 330; # Lock at 5 minutes 30 seconds
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 1800; # Suspend at 30 minutes
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
