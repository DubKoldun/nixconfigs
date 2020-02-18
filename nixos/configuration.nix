# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users.nix
    ];

    /* ; */

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;

    /* textraModulePackages = with config.boot.kernelPackages; [ rtl8812au ]; */
    /* kernelModules = [ "kvm-intel" ]; */
    /* kernelParams = [ "nomodoset" ]; */
  };

/*
  environment.variables = {
        MESA_LOADER_DRIVER_OVERRIDE = "iris";
  };
 */

  hardware = {
    enableAllFirmware = true;

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

      /* package = (pkgs.mesa.override {
        galliumDrivers = [ "nouveau" "iris" "virgl" "swrast" ]; # "virgl" "swrast"
      }).drivers; */

      /* extraPackages = with pkgs; [ */
        /* rocm-opencl-icd */
        /* vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-media-driver # only available starting nixos-19.03 or the current nixos-unstable
      ]; */
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system = {
    stateVersion = "19.09";
    autoUpgrade.enable = true;
  };


  services = {
    blueman.enable = true;

    xserver = {
      enable = true;

      videoDrivers = [ "modesetting" "intel" ];
      deviceSection = ''
        Option "DRI" "3"
        Option "TearFree" "true"
      '';
      /* useGlamor = true; */

      libinput = {
        enable = true;
        clickMethod = "buttonareas";
        naturalScrolling = false;
      };

      displayManager.sddm = {
        enable = true;
        /* theme = "sugar-dark"; */
      };

      desktopManager = {
         xfce = {
           enable = true;
           /* noDesktop = true; */
           /* enableXfwm = false; */
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

  networking.networkmanager.enable = true;

  nixpkgs = {
      config = {
          allowUnfree = true;

          /* rocmTargets = ["gfx803" "gfx900" "gfx906"]; */


          /* packageOverrides = pkgs : {
            vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
          }; */

      };
  };

  time.timeZone = "Europe/Moscow";
  sound.enable = true;
  # neteroworking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

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
