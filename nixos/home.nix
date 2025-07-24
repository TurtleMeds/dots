{ config, pkgs, zen-browser, ... }:

{
  imports = [
    ./user/hyprpanel.nix
    ./user/hypridle.nix
    ./user/hyprpaper.nix
    ./user/hyprlock.nix
    zen-browser.homeModules.beta
  ];
  home.username = "turtle";
  home.homeDirectory = "/home/turtle";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05";

  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/hypr/hyprland.conf".source = ../hypr/hyprland.conf;
    ".config/hypr/autostart.conf".source = ../hypr/autostart.conf;
    ".config/hypr/input.conf".source = ../hypr/input.conf;
    ".config/hypr/keybinds.conf".source = ../hypr/keybinds.conf;
    ".config/hypr/windowrules.conf".source = ../hypr/windowrules.conf;
  };

  programs = {
    nushell = {
      enable = true;
    };

    onlyoffice = {
      enable = true;
    };

    zen-browser = {
      enable = true;
    };
  };

  hyprpanel.enable = true;
  hypridle.enable = true;
  hyprpaper.enable = true;
  hyprlock.enable = true;
  
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/turtle/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
