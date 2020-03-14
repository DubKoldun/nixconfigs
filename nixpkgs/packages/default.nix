{ pkgs, ... }:

with pkgs; {
  home.packages = [
    firefox
    google-chrome
    git gitAndTools.diff-so-fancy

    # filesystem utility packages
    lf      # terminal file manager
    fd      # find
    exa     # rip ls
    file    # determine file type
    htop    # process management
    most    # page text file
    wget    # download
    jmtpfs  # a FUSE filesystem for MTP devices like Android phones
    ripgrep # rip grep

    # utility packages
    xclip      # clipboard manipulations
    gnumake    # control the generation of non-source files from sources
    binutils   # tools for manipulating binaries (linker, assembler, etc.)

    # editor
    typora

    # Unity
    # TODO Unity hub

    # terminal env
    kitty

    # terminal helpful
    man    # an interface to the on-line reference manuals
    tldr   # a collection of simplified and community-driven man pages
    psmisc # small useful utilities (such as fuser, killall and pstree)

    # graphic libs
    opencv4
    tesseract4   # ocs (optical character recognition)

    # frameworks
    # TODO Qt

    # messaging
    slack
    tdesktop

    # pictures
    gimp
    imagemagick  # tool for convert (pdf -> image)

    # document related
    feh
    evince
    libreoffice-unwrapped
    # TODO e-book-read

    # archive management
    zip   # package and compress (archive) files
    atool # archive command line helper
    unzip # zip format extraction
    unrar # utility for rar archives
    p7zip # 7z pack extraction

    # mpv          # a media player
    playerctl      # controlling media players
    pavucontrol    # PulseAudio Volume Control
    pulseeffects   # limiter, compressor, reverberation, equalizer and auto volume effects
    (speechd.override { withPulse = true; })

    # NixOS house keeping
    niv    # easy fetch for nix
    nox    # tools to make nix nicer to use
    vulnix # NixOS vulnerability scanner

    # languages related
    /* c++ */
    gcc
    gdb
    cmake
    valgrind

    /* kotlin */
    kotlin

    /* python */
    (python3.withPackages (ps: with ps; [ virtualenv pip ]))

    /* python2 */
    (python2.withPackages (ps: with ps; [ pip ]))

    /* dotnet */
    mono5
    dotnet-sdk_3
    omnisharp-roslyn
    dotnetCorePackages.aspnetcore_3_1
    dotnetCorePackages.netcore_3_1

    # other
    gvfs                    # 
    gnupg                   # the GNU Privacy Guard suite of programs
    gnutls                  # the GNU Transport Layer Security Library - software implementation of the TLS, SSL and DTLS protocols
    blueman                 # bluetooth
    gnome3.dconf            # FIXING bugs, wtf, idk
    shared-mime-info        # a database of common MIME types

    # entertainment
    steam

  ];
}
