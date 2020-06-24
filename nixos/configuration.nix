# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

/* let sources = import ../../nix/sources.nix;
in  */

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  hardware = {
    enableAllFirmware = true;

    brightnessctl.enable = true;

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };

    cpu = {
      intel.updateMicrocode = true;
    };

    opengl = {
      enable = true;
      package = pkgs.mesa.drivers;

      extraPackages = with pkgs; [
             libGL
             vaapiIntel
             vaapiVdpau
             libvdpau-va-gl
             intel-media-driver
             ];
      setLdLibraryPath = true;

      package32 = pkgs.pkgsi686Linux.mesa.drivers;
      driSupport = true;
      driSupport32Bit = true;
    };


  };

  system = {
    stateVersion = "20.03";
    autoUpgrade.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pkgs.qt5.qtgraphicaleffects pkgs.qt5.qtmultimedia
    (steam.override { extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ]; nativeOnly = true; }).run
    ];

  services = {
    gvfs.enable = true;
    blueman.enable = true;

    xserver = {
      enable = true;

      videoDrivers = [ "modesetting" "intel" "libvulkan1" "mesa-vulkan-drivers" "vulkan-utils" ]; #libgl1-mesa-dri:i386  mesa-vulkan-drivers:i386
      deviceSection = ''
        Option "DRI" "3"
        Option "TearFree" "true"
      '';

      libinput = {
        enable = true;
        clickMethod = "buttonareas";
        naturalScrolling = false;
      };

      displayManager.sddm = let fetchedTheme = (import ../nivSource/sources.nix).sddm_theme_sugar_dark;
      in {
        enable = true;
        theme = with pkgs.lib;
          lists.last (strings.splitString "/" (builtins.toString fetchedTheme));
        extraConfig = ''
          [Theme]
          ThemeDir=${fetchedTheme}/..
          CursorTheme=Paper
        '';
      };

      desktopManager = {
         xterm.enable = false;
         /* xfce4-14.enable = true; */
         xfce = {
           enable = true;
           extraSessionCommands = "sysctl net.ipv4.ip_default_ttl=65\nsudo xfce4-power-manager";
         };
      };

      windowManager.awesome = {
        enable = true;
      };

      layout = "us,ru";
      xkbOptions = "grp:ctrl_alt_toggle";

    };
  };

  fonts = {
    fontconfig = {
      enable = true;
    };

    fonts = with pkgs; [
      ubuntu_font_family
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      comfortaa
    ];
  };

  networking = {
    networkmanager.enable = true;

    useDHCP = false;

    interfaces.wlp2s0.useDHCP = true;

  };

  nixpkgs = {
      config = {
          allowUnfree = true;
          /* allowBroken = true; */
      };
  };

  time.timeZone = "Europe/Moscow";
  sound.enable = true;

  /* dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_2_2 sdk_3_0 sdk aspnetcore_3_1 netcore_3_1]; */

  # neteroworking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  # system.stateVersion = "19.09"; # Did you read the comment? YES!

}
