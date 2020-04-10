{ pkgs, ... }:

{
  systemd.user.services.xfce-power-manager = {

    Install.WantedBy = [ "graphical-session.target" ];

    Service = {
      ExecStart = "${pkgs.xfce4-14.xfce4-power-manager}/bin/xfce4-power-manager";
      Restart = "on-abort";
    };

  };
}
