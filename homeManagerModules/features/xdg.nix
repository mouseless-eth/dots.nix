{
  config,
  lib,
  ...
}: let
  browser = ["chromium.desktop"];

  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = ["chromium-browser.desktop"];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    "audio/*" = ["mpv.desktop"];
    "video/*" = ["mpv.dekstop"];
    "image/*" = ["imv.desktop"];
    "application/json" = browser;
    "application/pdf" = ["org.pwmt.zathura.desktop.desktop"];
    "x-scheme-handler/discord" = ["discord.desktop"];
    "x-scheme-handler/spotify" = ["spotify.desktop"];
    "x-scheme-handler/tg" = ["telegramdesktop.desktop"];
  };
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_DEV_DIR = "$HOME/projects";
        XDG_DESKTOP_DIR = "$HOME/desktop";
        XDG_DOWNLOAD_DIR = "$HOME/downloads";
        XDG_TEMPLATES_DIR = "$HOME/templates";
        XDG_PUBLICSHARE_DIR = "$HOME/public";
        XDG_DOCUMENTS_DIR = "$HOME/documents";
        XDG_MUSIC_DIR = "$HOME/music";
        XDG_PICTURES_DIR = "$HOME/pictures";
        XDG_SCREENSHOTS_DIR = "$HOME/pictures/screenshots";
        XDG_VIDEOS_DIR = "$HOME/videos";
      };
    };
  };
}
