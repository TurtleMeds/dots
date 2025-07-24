{ config, pkgs, lib, ... }:

{
  options = {
    hyprpaper.enable = lib.mkEnableOption "enables hyprpaper with custom config";
  };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper =
    let
      image = (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/8f538b4e34a880748a471dc4c7aade6e29982417/nature/forest_stairs.jpg";
        sha256 = "9f254a9d3241e747b504ec63efac9ddf67e3f7ec94f1bef90bc8bec4dacaf944";
      });
    in {
      enable = true;
      settings = {
        preload = "${image}";
        wallpaper = ",${image}";
      };
    };
  };
}
