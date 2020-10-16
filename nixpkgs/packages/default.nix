{ pkgs, ... }:

let
  sources = import ../../nix/sources.nix;
  turbopkgs = import "${sources.nixpkgs-turbo}" { config = { allowUnfree = true; };  };
in with pkgs; {
  home.packages = [
    firefox
    google-chrome
    git gitAndTools.diff-so-fancy

    # filesystem utility packages
    lf          # terminal file manager
    fd          # find
    exa         # rip ls
    file        # determine file type
    htop        # process management
    most        # page text file
    wget        # download
    jmtpfs      # a FUSE filesystem for MTP devices like Android phones
    ripgrep     # rip grep

    # utility packages
    xclip      # clipboard manipulations
    gnumake    # control the generation of non-source files from sources
    binutils   # tools for manipulating binaries (linker, assembler, etc.)

    # editor
    typora

    # terminal
    kitty

    # terminal helpful
    man    # an interface to the on-line reference manuals
    tldr   # a collection of simplified and community-driven man pages
    drive  # google drive control from terminal
    psmisc # small useful utilities (such as fuser, killall and pstree)

    # graphical libs
    libpng       # The official reference implementation for the PNG file format with animation patch
    opencv       # Open Computer Vision Library
    leptonica    # image processing and analysis library
    tesseract4   # ocr (optical character recognition)

    # communication apps
    discord
    slack
    tdesktop
    zoom-us

    # pictures
    gimp
    feh
    imagemagick    # tool for convert (pdf -> image)
    viewnior
    wl-clipboard
    flameshot

    # document related
    evince
    # wpsoffice
    libreoffice
    # pandoc
    # texlive.combined.scheme-medium

    # archive management
    atool # archive command line helper
    p7zip # 7z pack extraction
    unrar # utility for rar archives
    unzip # zip format extraction
    zip   # package and compress (archive) files

    # media
    mpv            # a media player
    audacity
    ffmpeg_4
    playerctl      # controlling media players
    obs-studio     # recording and stream
    pavucontrol    # PulseAudio Volume Control
    pulseeffects   # limiter, compressor, reverberation, equalizer and auto volume effects
    (speechd.override { withPulse = true; })

    haskellPackages.xmonad-screenshot

    # NixOS house keeping
    niv          # easy fetch for nix
    nox          # tools to make nix nicer to use
    pkg-config   # A tool that allows packages to find out information about other packages

    # server
    # nginx
    heroku # deployment
    # certbot # ACME client that can obtain certs and extensibly update server configurations

    # data base
    pgcli
    postgresql

    # other
    gvfs                    #
    etcher
    gnupg                   # the GNU Privacy Guard suite of programs
    light                   # brightness
    gnutls                  # the GNU Transport Layer Security Library - software implementation of the TLS, SSL and DTLS protocols
    blueman                 # bluetooth
    gnome3.dconf            # FIXING bugs, wtf, idk
    shared-mime-info        # a database of common MIME types

    # xfce
    xorg.xbacklight
    xfce4-14.xfce4-appfinder
    xfce4-14.xfce4-power-manager
    /* xfce4-14.xfce4-battery-plugin */
    /* xfce4-14.xfce4-pulseaudio-plugin */

    # entertainment
    steam
    spotify
    minecraft
    qbittorrent
    megasync

  ];
}
