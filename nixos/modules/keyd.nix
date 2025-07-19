{ config, lib, pkgs, ...}:

{
  imports = [
    # paths to other modules
  ];

  options = {
    keyd.enable = lib.mkEnableOption "enables keyd";
  };

  config = lib.mkIf config.keyd.enable {
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" "-303a:8253:65bd1f84" ];
        extraConfig = ''
          [main]

          capslock = overload(arrows, esc)
          bookmarks = toggle(gaming)

          # home row mods

          a = overloadi(a, overloadt(alt, a, 125), 150)
          s = overloadi(s, overloadt(shift, s, 125), 150)
          d = overloadi(d, overloadt(control, d, 125), 150)
          f = overloadi(f, overloadt(meta, f, 125), 150)

          j = overloadi(j, overloadt(meta, j, 125), 150)
          k = overloadi(k, overloadt(control, k, 125), 150)
          l = overloadi(l, overloadt(shift, l, 125), 150)
          ; = overloadi(;, overloadt(alt, ;, 125), 150)

          [gaming]

          a = a
          s = s
          d = d
          f = f

          j = j
          k = k
          l = l
          ; = ;

          [arrows]

          h = left
          j = down
          k = up
          l = right
        '';
      };
    };
  };
}
