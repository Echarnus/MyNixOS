{ pkgs, lib, config, ...}: {
    gtk = {

        enable = true;

        cursorTheme = {
          name = "macOS";
          package = pkgs.apple-cursor;
          size = 32;
        };

        iconTheme = {
          name = "WhiteSur-dark";
          package = pkgs.whitesur-icon-theme;
        };

        theme = {
          name = "WhiteSur-Dark";
          package = pkgs.whitesur-gtk-theme;
        };

        gtk2.extraConfig = ''
          gtk-modules="appmenu-gtk-module"
        '';

        gtk3.extraConfig = {
          gtk-modules="appmenu-gtk-module";
        };
    };

    home.packages = with pkgs; [ 
        gnomeExtensions.blur-my-shell
        gnomeExtensions.caffeine
        gnomeExtensions.dash-to-dock
        gnomeExtensions.just-perfection
        gnomeExtensions.logo-menu
        gnomeExtensions.user-themes
        gnomeExtensions.applications-menu
    ];

  dconf.enable = true;
  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        caffeine@patapon.info
        dash-to-dock@micxgx.gmail.com
        blur-my-shell@aunetx
        logo-menu.extensionUuid
        just-perfection.extensionUuid
        user-themes.extensionUuid
        applications-menu.extensionUuid

      ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-fixed = true;
      dock-position = "CENTER";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-Dark";
    };
  };
}
