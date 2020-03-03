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
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system = {
    stateVersion = "19.09";
    autoUpgrade.enable = true;
  };

  environment.systemPackages = [ pkgs.qt5.qtgraphicaleffects ];

  services = {
    blueman.enable = true;

    xserver = {
      enable = true;

      videoDrivers = [ "modesetting" "intel" ];
      deviceSection = ''
        Option "DRI" "3"
        Option "TearFree" "true"
      '';

      libinput = {
        enable = true;
        clickMethod = "buttonareas";
        naturalScrolling = false;
      };

      displayManager.sddm = let
        fetchedTheme = pkgs.fetchFromGitHub {
            owner = "MarianArlt";
            repo = "sddm-sugar-dark";
            rev = "9fc363cc3f6b3f70df948c88cbe26989386ee20d";
            sha256 = "1vb0gr9i4dj6bzrx73cacnn012crvpj4d1n3yiw5w2yhrbpjkql7";
        };

        themeName = with builtins;
          let folders = split "/" (toString fetchedTheme);
          in elemAt folders (length folders - 1);
      in {

        enable = true;
        theme = themeName;
        extraConfig = ''
          [Theme]
          ThemeDir=${fetchedTheme}/..
          CursorTheme=Paper
        '';
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

  networking = {
    networkmanager.enable = true;

    useDHCP = false;

    interfaces.wlp2s0.useDHCP = true;

  };

  nixpkgs = {
      config = {
          allowUnfree = true;
      };
  };

  time.timeZone = "Europe/Moscow";
  sound.enable = true;



  /* dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_2_2 sdk_3_0 sdk aspnetcore_2_1 ]; */

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
