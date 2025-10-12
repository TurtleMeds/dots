{ config, pkgs, lib, ... }:

{
  options = {
    hyprpanel.enable = lib.mkEnableOption "enables hyprpanel with custom config";
  };

  config = lib.mkIf config.hyprpanel.enable {
    programs.hyprpanel =
    let
      image = (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/8f538b4e34a880748a471dc4c7aade6e29982417/nature/forest_stairs.jpg";
        sha256 = "9f254a9d3241e747b504ec63efac9ddf67e3f7ec94f1bef90bc8bec4dacaf944";
      });
    in {
      enable = true;
      settings = {
        theme = {
          font = {
            name = "FiraCode Nerd Font";
            label = "FiraCode Nerd Font Semi-Bold";
            size = "1rem";
            weight = 600;
            style = "normal";
          };
          bar = {
            menus = {
              background = "#2b3339";
              text = "#d3c6aa";
              border = {
                color = "#454b53";
              };
              menu = {
                volume = {
                  text = "#d3c6aa";
                  card = {
                    color = "#2f383e";
                  };
                  label = {
                    color = "#e67e80";
                  };
                  input_slider = {
                    puck = "#83c092";
                    backgroundhover = "#454b53";
                    background = "#83c093";
                    primary = "#dbbc7f";
                  };
                  audio_slider = {
                    puck = "#83c092";
                    backgroundhover = "#454b53";
                    background = "#83c093";
                    primary = "#dbbc7f";
                  };
                  icons = {
                    active = "#dbbc7f";
                    passive = "#868d80";
                  };
                  iconbutton = {
                    active = "#dbbc7f";
                    passive = "#d3c6aa";
                  };
                  listitems = {
                    active = "#dbbc7e";
                    passive = "#d3c6aa";
                  };
                  border = {
                    color = "#2f383e";
                  };
                  background = {
                    color = "#2b3339";
                  };
                };
                dashboard = {
                  powermenu = {
                    shutdown = "#e67e80";
                    confirmation = {
                      deny = "#e67e80";
                      confirm = "#a7c080";
                      button_text = "#2b3339";
                      body = "#d3c6aa";
                      label = "#a7c080";
                      border = "#454b53";
                      background = "#2b3339";
                      card = "#2f383e";
                    };
                    sleep = "#83c092";
                    logout = "#a7c080";
                    restart = "#dbbc7f";
                  };
                  monitors = {
                    disk = {
                      label = "#d699b6";
                      bar = "#d699b6";
                      icon = "#d699b6";
                    };
                    gpu = {
                      label = "#a7c080";
                      bar = "#a7c080";
                      icon = "#a7c080";
                    };
                    ram = {
                      label = "#dbbc7f";
                      bar = "#dbbc7f";
                      icon = "#dbbc7f";
                    };
                    cpu = {
                      label = "#e67e80";
                      bar = "#e67e80";
                      icon = "#e67e80";
                    };
                    bar_background = "#445055";
                  };
                  directories = {
                    right = {
                      bottom = {
                        color = "#a7c080";
                      };
                      middle = {
                        color = "#83c092";
                      };
                      top = {
                        color = "#a7c080";
                      };
                    };
                    left = {
                      bottom = {
                        color = "#e67e80";
                      };
                      middle = {
                        color = "#dbbc7f";
                      };
                      top = {
                        color = "#d699b6";
                      };
                    };
                  };
                  controls = {
                    input = {
                      text = "#3a4248";
                      background = "#d699b6";
                    };
                    volume = {
                      text = "#3a4248";
                      background = "#e67e80";
                    };
                    notifications = {
                      text = "#3a4248";
                      background = "#dbbc7f";
                    };
                    bluetooth = {
                      text = "#3a4248";
                      background = "#83c092";
                    };
                    wifi = {
                      text = "#3a4248";
                      background = "#83c092";
                    };
                    disabled = "#5c6a72";
                  };
                  shortcuts = {
                    recording = "#a7c080";
                    text = "#3a4248";
                    background = "#a7c080";
                  };
                  profile = {
                    name = "#d699b6";
                  };
                  border = {
                    color = "#454b53";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  card = {
                    color = "#2f383e";
                  };
                };
                notifications = {
                  switch = {
                    puck = "#445055";
                    disabled = "#454b54";
                    enabled = "#a7c080";
                  };
                  clear = "#e67e80";
                  switch_divider = "#445055";
                  border = "#454b53";
                  card = "#2f383e";
                  background = "#2b3339";
                  no_notifications_label = "#454b53";
                  label = "#a7c080";
                  pager = {
                    button = "#a7c080";
                    label = "#7a8478";
                    background = "#2b3339";
                  };
                  scrollbar = {
                    color = "#a7c080";
                  };
                };
                clock = {
                  weather = {
                    hourly = {
                      temperature = "#d699b6";
                      icon = "#d699b6";
                      time = "#d699b6";
                    };
                    thermometer = {
                      extremelycold = "#83c092";
                      cold = "#83c092";
                      moderate = "#a7c080";
                      hot = "#dbbc7f";
                      extremelyhot = "#e67e80";
                    };
                    stats = "#d699b6";
                    status = "#83c092";
                    temperature = "#d3c6aa";
                    icon = "#d699b6";
                  };
                  calendar = {
                    contextdays = "#5c6a72";
                    days = "#d3c6aa";
                    currentday = "#d699b6";
                    paginator = "#d699b6";
                    weekdays = "#d699b6";
                    yearmonth = "#83c092";
                  };
                  time = {
                    timeperiod = "#83c092";
                    time = "#d699b6";
                  };
                  text = "#d3c6aa";
                  border = {
                    color = "#454b53";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  card = {
                    color = "#2f383e";
                  };
                };
                battery = {
                  slider = {
                    puck = "#445055";
                    backgroundhover = "#445055";
                    background = "#5c6a72";
                    primary = "#dbbc7f";
                  };
                  icons = {
                    active = "#dbbc7f";
                    passive = "#9399b2";
                  };
                  listitems = {
                    active = "#dbbc7f";
                    passive = "#445055";
                  };
                  text = "#d3c6aa";
                  label = {
                    color = "#dbbc7f";
                  };
                  border = {
                    color = "#454b53";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  card = {
                    color = "#2f383e";
                  };
                };
                systray = {
                  dropdownmenu = {
                    divider = "#2f383e";
                    text = "#d3c6aa";
                    background = "#2b3339";
                  };
                };
                bluetooth = {
                  iconbutton = {
                    active = "#a7c080";
                    passive = "#d3c6aa";
                  };
                  icons = {
                    active = "#a7c080";
                    passive = "#868d80";
                  };
                  listitems = {
                    active = "#a7c07f";
                    passive = "#d3c6aa";
                  };
                  switch = {
                    puck = "#454b53";
                    disabled = "#2f383e";
                    enabled = "#a7c080";
                  };
                  switch_divider = "#454b53";
                  status = "#868d80";
                  text = "#d3c6aa";
                  label = {
                    color = "#a7c080";
                  };
                  border = {
                    color = "#2f383e";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  card = {
                    color = "#2f383e";
                  };
                  scroller = {
                    color = "#83c092";
                  };
                };
                network = {
                  iconbuttons = {
                    active = "#e69875";
                    passive = "#d3c6aa";
                  };
                  icons = {
                    active = "#e69875";
                    passive = "#868d80";
                  };
                  listitems = {
                    active = "#e69874";
                    passive = "#d3c6aa";
                  };
                  status = {
                    color = "#868d80";
                  };
                  text = "#d3c6aa";
                  label = {
                    color = "#e69875";
                  };
                  border = {
                    color = "#2f383e";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  card = {
                    color = "#2f383e";
                  };
                  switch = {
                    enabled = "#e69875";
                    disabled = "#2f383e";
                    puck = "#454b53";
                  };
                  scroller = {
                    color = "#83c092";
                  };
                };
                media = {
                  slider = {
                    puck = "#868d80";
                    backgroundhover = "#454b53";
                    background = "#83c093";
                    primary = "#a7c080";
                  };
                  buttons = {
                    text = "#2b3339";
                    background = "#83c092";
                    enabled = "#a7c080";
                    inactive = "#83c092";
                  };
                  border = {
                    color = "#2f383e";
                  };
                  background = {
                    color = "#2b3339";
                  };
                  album = "#a7c080";
                  artist = "#a7c080";
                  song = "#83c092";
                  card = {
                    color = "#2f383e";
                  };
                  timestamp = "#d3c6aa";
                };
                power = {
                  buttons = {
                    sleep = {
                      icon_background = "#83c092";
                      text = "#83c092";
                      background = "#2f383e";
                      icon = "#3a4248";
                    };
                    restart = {
                      text = "#dbbc7f";
                      icon_background = "#dbbc7f";
                      icon = "#3a4248";
                      background = "#2f383e";
                    };
                    logout = {
                      icon = "#3a4248";
                      background = "#2f383e";
                      text = "#a7c080";
                      icon_background = "#a7c080";
                    };
                    shutdown = {
                      icon = "#3a4248";
                      background = "#2f383e";
                      icon_background = "#e67e80";
                      text = "#e67e80";
                    };
                  };
                  border = {
                    color = "#454b53";
                  };
                  background = {
                    color = "#2b3339";
                  };
                };
              };
              popover = {
                text = "#a7c080";
                background = "#3a4248";
                border = "#3a4248";
              };
              tooltip = {
                text = "#d3c6aa";
                background = "#2b3339";
              };
              dropdownmenu = {
                divider = "#2f383e";
                text = "#d3c6aa";
                background = "#2b3339";
              };
              slider = {
                puck = "#868d80";
                backgroundhover = "#454b53";
                background = "#83c093";
                primary = "#83c092";
              };
              progressbar = {
                background = "#454b53";
                foreground = "#83c092";
              };
              iconbuttons = {
                active = "#83c092";
                passive = "#d3c6aa";
              };
              buttons = {
                text = "#2b3339";
                disabled = "#83c093";
                active = "#a7c080";
                default = "#83c092";
              };
              switch = {
                puck = "#454b53";
                disabled = "#2f383e";
                enabled = "#83c092";
              };
              icons = {
                active = "#83c092";
                passive = "#83c092";
              };
              listitems = {
                active = "#83c091";
                passive = "#d3c6aa";
              };
              label = "#83c092";
              feinttext = "#2f383e";
              dimtext = "#83c092";
              cards = "#2f383e";
              check_radio_button = {
                background = "#000000";
                active = "#ffffff";
              };
            };
            background = "#2b3339";
            buttons = {
              media = {
                icon = "#a7c080";
                text = "#a7c080";
                background = "#323d43";
                icon_background = "#a7c080";
                border = "#a7c080";
              };
              icon = "#a7c080";
              text = "#a7c080";
              hover = "#445055";
              background = "#323d43";
              notifications = {
                total = "#83c092";
                icon = "#83c092";
                background = "#323d43";
                icon_background = "#a7c080";
                border = "#83c092";
              };
              clock = {
                icon = "#dbbc7f";
                text = "#dbbc7f";
                background = "#323d43";
                icon_background = "#d699b6";
                border = "#dbbc7f";
              };
              battery = {
                icon = "#e69875";
                text = "#e69875";
                background = "#323d43";
                icon_background = "#dbbc7f";
                border = "#e69875";
              };
              systray = {
                background = "#323d43";
                border = "#454b53";
                customIcon = "#d8caac";
              };
              bluetooth = {
                icon = "#a7c080";
                text = "#a7c080";
                background = "#323d43";
                icon_background = "#89dbeb";
                border = "#a7c080";
              };
              network = {
                icon = "#e69875";
                text = "#e69875";
                background = "#323d43";
                icon_background = "#caa6f7";
                border = "#e69875";
              };
              volume = {
                icon = "#dbbc7f";
                text = "#dbbc7f";
                background = "#323d43";
                icon_background = "#e67e80";
                border = "#dbbc7f";
                enableBorder = false;
              };
              windowtitle = {
                icon = "#dbbc7f";
                text = "#dbbc7f";
                background = "#323d43";
                icon_background = "#d699b6";
                border = "#dbbc7f";
                enableBorder = true;
              };
              workspaces = {
                active = "#dbbc7f";
                occupied = "#e69875";
                available = "#a7c080";
                hover = "#454b53";
                background = "#323d43";
                numbered_active_highlighted_text_color = "#21252b";
                numbered_active_underline_color = "#ffffff";
                border = "#2b3339";
                enableBorder = false;
                numbered_active_highlight_border = "0.2em";
                numbered_active_highlight_padding = "0.5em";
              };
              dashboard = {
                icon = "#e69875";
                background = "#323d43";
                border = "#e69875";
              };
              style = "default";
              modules = {
                ram = {
                  icon = "#dbbc7f";
                  icon_background = "#dbbc7f";
                  text = "#dbbc7f";
                  background = "#323d43";
                  border = "#dbbc7f";
                };
                storage = {
                  icon_background = "#e67e80";
                  icon = "#e67e80";
                  background = "#323d43";
                  text = "#e67e80";
                  border = "#e67e80";
                };
                updates = {
                  background = "#323d43";
                  icon_background = "#83c092";
                  text = "#83c092";
                  icon = "#83c092";
                  border = "#83c092";
                };
                netstat = {
                  background = "#323d43";
                  text = "#a7c080";
                  icon = "#a7c080";
                  icon_background = "#a7c080";
                  border = "#a7c080";
                  enableBorder = false;
                };
                weather = {
                  icon = "#a7c080";
                  text = "#a7c080";
                  icon_background = "#a7c080";
                  background = "#323d43";
                  border = "#a7c080";
                };
                power = {
                  icon = "#e67e80";
                  icon_background = "#e67e80";
                  background = "#323d43";
                  border = "#e67e80";
                };
                cpu = {
                  background = "#323d43";
                  icon = "#e67e80";
                  icon_background = "#e67e80";
                  text = "#e67e80";
                  border = "#e67e80";
                };
                kbLayout = {
                  icon_background = "#83c092";
                  icon = "#83c092";
                  background = "#323d43";
                  text = "#83c092";
                  border = "#83c092";
                };
                submap = {
                  background = "#323d43";
                  text = "#83c092";
                  border = "#83c092";
                  icon = "#83c092";
                  icon_background = "#323d43";
                };
                hyprsunset = {
                  icon = "#dbbc7f";
                  background = "#323d43";
                  icon_background = "#dbbc7f";
                  text = "#dbbc7f";
                  border = "#dbbc7f";
                };
                hypridle = {
                  icon = "#e67e80";
                  background = "#323d43";
                  icon_background = "#e67e80";
                  text = "#e67e80";
                  border = "#e67e80";
                };
                cava = {
                  text = "#83c092";
                  background = "#323d43";
                  icon_background = "#323d43";
                  icon = "#83c092";
                  border = "#83c092";
                };
                microphone = {
                  border = "#a7c080";
                  background = "#323d43";
                  text = "#a7c080";
                  icon = "#a7c080";
                  icon_background = "#323d43";
                  enableBorder = false;
                };
                worldclock = {
                  text = "#dbbc7f";
                  background = "#323d43";
                  icon_background = "#d699b6";
                  icon = "#dbbc7f";
                  border = "#dbbc7f";
                };
              };
              icon_background = "#323d43";
              borderColor = "#a7c080";
              background_opacity = 80;
              monochrome = false;
              opacity = 100;
            };
            border = {
              color = "#83c092";
            };
            floating = true;
            transparent = false;
            opacity = 80;
          };
          osd = {
            label = "#d3c6aa";
            icon = "#2b3339";
            bar_overflow_color = "#e67e80";
            bar_empty_color = "#504945";
            bar_color = "#d3c6aa";
            icon_container = "#d3c6aa";
            bar_container = "#2b3339";
            orientation = "horizontal";
            location = "bottom";
            duration = 500;
            muted_zero = false;
            margins = "10px 10px 40px 10px";
            enableShadow = false;
          };
          notification = {
            close_button = {
              label = "#2b3339";
              background = "#e67e80";
            };
            labelicon = "#d3c6aa";
            text = "#d8caac";
            time = "#a89984";
            border = "#323d43";
            label = "#d3c6aa";
            actions = {
              text = "#2b3339";
              background = "#a7c080";
            };
            background = "#2b3239";
            enableShadow = false;
          };
          matugen = false;
          matugen_settings = {
            mode = "dark";
            scheme_type = "expressive";
          };
        };
        scalingPriority = "hyprland";
        menus = {
          dashboard = {
            powermenu = {
              avatar = {
                inherit image;
              };
            };
            shortcuts = {
              left = {
                shortcut1 = {
                  icon = "";
                  command = "zen-browser";
                  tooltip = "Zen";
                };
                shortcut3 = {
                  tooltip = "Vesktop";
                  command = "vesktop";
                };
                shortcut4 = {
                  command = "wofi -show drun";
                };
              };
            };
            directories = {
              left = {
                directory3 = {
                  command = "bash -c \"xdg-open $HOME/proj/\"";
                };
              };
            };
          };
          clock = {
            weather = {
              location = "Seattle";
              key = "b4134b72a9ff42cc9a000749251305";
            };
            time = {
              hideSeconds = false;
            };
          };
          volume = {
            raiseMaximumVolume = true;
          };
        };
        bar = {
          workspaces = {
            show_numbered = true;
            workspaceMask = false;
            showWsIcons = false;
            showApplicationIcons = false;
            show_icons = false;
            numbered_active_indicator = "highlight";
          };
          network = {
            showWifiInfo = true;
            rightClick = "kitty --class network nmtui";
          };
          layouts = [
            {
              left = [
                "dashboard"
                "clock"
                "workspaces"
              ];
              middle = [
                "windowtitle"
              ];
              right = [
                "hypridle"
                "hyprsunset"
                "volume"
                "network"
                "systray"
                "notifications"
              ];
            }
            {
              left = [
                "dashboard"
                "clock"
                "workspaces"
              ];
              middle = [
                "windowtitle"
              ];
              right = [
                "hypridle"
                "hyprsunset"
                "volume"
                "network"
                "systray"
                "notifications"
              ];
            }
            {
              left = [
                "dashboard"
                "clock"
                "workspaces"
              ];
              middle = [
                "windowtitle"
              ];
              right = [
                "hypridle"
                "hyprsunset"
                "volume"
                "network"
                "systray"
                "notifications"
              ];
            }
          ];
          customModules = {
            kbLayout = {
              labelType = "code";
            };
            hypridle = {
              label = false;
            };
            hyprsunset = {
              temperature = "2000k";
              label = false;
              offIcon = "";
              onIcon = "󰖚";
            };
            storage = {
              paths = [
                "/"
              ];
            };
          };
          windowtitle = {
            custom_title = false;
            label = true;
            class_name = false;
            title_map = [

            ];
            icon = false;
            truncation = true;
          };
          clock = {
            icon = "󰸗";
            showIcon = true;
            showTime = true;
            format = "%a %b %d %I:%M %p";
          };
          bluetooth = {
            label = false;
          };
        };
        wallpaper = {
          inherit image;
        };
        notifications = {
          position = "top";
          clearDelay = 100;
        };
      };
    };
  };
}
