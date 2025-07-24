{ config, pkgs, lib, ... }:

{
  options = {
    hyprlock.enable = lib.mkEnableOption "enables hyprlock with custom config";
  };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock =
    let
      image = (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/8f538b4e34a880748a471dc4c7aade6e29982417/nature/forest_stairs.jpg";
        sha256 = "9f254a9d3241e747b504ec63efac9ddf67e3f7ec94f1bef90bc8bec4dacaf944";
      });
    in {
      enable = true;
      settings = {
        general = {
        	ignore_empty_input = true;
        	immediate_render = true;
        };

        background = [
          {
          	path = "${image}";
          	color = "rgba(45, 53, 61, 1.0)";
          }
        ];

        input-field = [
          {
          	size = "15%, 5%";
          	outline_thickness = 3;
          	fade_on_empty = false;
          	hide_input = false;
          	inner_color = "rgba(66, 80, 71, 1)";
          	outer_color = "rgb(211, 198, 170)";
          	font_color = "rgb(211, 198, 170)";
          	zindex = 20;
          }
        ];

        shape = [
          {
          	size = "700, 500";
          	rounding = 60;
          	color = "rgb(2d353b)";
          }
        ];

        label = [
          {
          	text = "$TIME12";
          	color = "rgb(211, 198, 170)";
          	position = "0, 400";
          	font_size = 110;
          	font_family = "Fira Bold";
          }
          {
          	text = ''<i>  $USER </i>'';
          	color = "rgb(211, 198, 170)";
          	position = "0, 100";
          	font_size = 32;
          	font_family = "Fira Semibold";
          }
        ];
      };
    };
  };
}
