# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system/keyd.nix
    ];

  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.luks.devices."luks-b01adcf6-24b6-44f7-bd7b-575980bcaa3a".device = "/dev/disk/by-uuid/b01adcf6-24b6-44f7-bd7b-575980bcaa3a";
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    plymouth = {
      enable = true;
      themePackages = [ pkgs.adi1090x-plymouth-themes ];
      theme = "dark_planet";
    };
    consoleLogLevel = 3;
  };

  networking.hostName = "home"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  keyd.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.hypridle.enable = true;
  services.flatpak.enable = true;
  services.printing.enable = true;
  
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.turtle = {
    isNormalUser = true;
    description = "Owen Wells";
    extraGroups = [ "networkmanager" "wheel" "dialout" "tty"];
    shell = pkgs.nushell;
    
    packages = with pkgs; [
      gruvbox-kvantum
    ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
    firefox.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    kdeconnect.enable = true;
  };


  qt.style = "kvantum";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    helix
    mangohud
    protonup
    ungoogled-chromium
    orca-slicer
    gimp
    inkscape
    kdePackages.kate
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    albert
    neomutt
    mutt-wizard
    qbittorrent
    eddie
    vesktop
    zoom-us
    thunderbird
    ocs-url
    hyprpanel
    zellij
    carapace
    fish
    zoxide
    hyfetch
    fastfetch
    kitty
    rofi
    git
    gh
    hyprpaper
    hyprlock
    hyprsunset
    wl-clipboard
    gnupg
    pinentry-gnome3
    keyd
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  fileSystems."/mnt/nas" = {
    device = "//192.168.1.50/Nas";
    fsType = "cifs";
    options = let
      # These automount options prevent hanging on network issues
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts},username=turtle,password=zwUWRFTFjyXVJZ6AdL6g,uid=1000,gid=100,dir_mode=0755,file_mode=0644"
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
