{ pkgs, ... }:

with pkgs; {
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
    electron_5  # Cross platform desktop application shell (for typora)

    # utility packages
    xclip      # clipboard manipulations
    gnumake    # control the generation of non-source files from sources
    binutils   # tools for manipulating binaries (linker, assembler, etc.)

    # editor
    # typora

    # Unity
    /* unity3d
    unityhub */

    # terminal env
    kitty

    # terminal helpful
    man    # an interface to the on-line reference manuals
    tldr   # a collection of simplified and community-driven man pages
    drive  # google drive control from terminal
    psmisc # small useful utilities (such as fuser, killall and pstree)

    # graphic libs
    libpng       # The official reference implementation for the PNG file format with animation patch
    opencv       # Open Computer Vision Library
    leptonica    # inmage processing and analysis library
    tesseract4   # ocr (optical character recognition)

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
    /* libreoffice-fresh */
    # TODO e-book-read

    # archive management
    zip   # package and compress (archive) files
    atool # archive command line helper
    unzip # zip format extraction
    unrar # utility for rar archives
    p7zip # 7z pack extraction

    # media
    mpv            # a media player
    audacity
    ffmpeg_4
    playerctl      # controlling media players
    # obs-studio     # recording and stream
    pavucontrol    # PulseAudio Volume Control
    pulseeffects   # limiter, compressor, reverberation, equalizer and auto volume effects
    (speechd.override { withPulse = true; })

    # NixOS house keeping
    niv          # easy fetch for nix
    nox          # tools to make nix nicer to use
    vulnix       # NixOS vulnerability scanner
    pkg-config   # A tool that allows packages to find out information about other packages

    # languages related
    /* c++ */
    gcc
    gdb
    glibc
    cmake
    valgrind

    /* haskell */
    (ghc.withPackages (ps: with ps; [
       # stack cabal            # builders
       hlint
       stylish-haskell        # prettyfier
       unordered-containers   # containers for lab
       hspec hedgehog tasty   # testing
       tasty-hedgehog         # testing
       tasty-hspec            # testing
       alex                   # generating lexical analysers in Haskell
       happy                  # parser generator for Haskell
       ] )
    )

    /* kotlin */
    kotlin

    /* python */
    (python3.withPackages (ps: with ps; [ virtualenv pip ]))

    /* python2 */
    /* (python2.withPackages (ps: with ps; [ pip ])) */

    /* dotnet */
    /* mono5
    dotnet-sdk_3
    omnisharp-roslyn
    dotnetCorePackages.netcore_3_1
    dotnetCorePackages.aspnetcore_3_1 */

    # other
    etcher
    gvfs                    #
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
    minecraft
    discord
    /* zoom-us */

  ];
}
