{ ... }:

{
    xdg.configFile."awesome/rc.lua".source = ./config.lua;
    xdg.configFile."awesome/theme.lua".source = ./theme.lua; # default theme
    # xdg.configFile."awesome/theme.lua".source = ./powerarrow/theme.lua;
    # xdg.configFile."awesome/icons".source = ./powerarrow/icons;
    # xdg.configFile."awesome/binblock.lua".source = ./powerarrow/binclock.lua;
    # xdg.configFile."awesome/wall.png".source = ./powerarrow/wall.png;
}