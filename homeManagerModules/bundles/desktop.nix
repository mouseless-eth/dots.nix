{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.waybar.enable = lib.mkDefault true;
  myHomeManager.hyprpaper.enable = lib.mkDefault true;
  myHomeManager.dunst.enable = lib.mkDefault true;
  myHomeManager.rofi.enable = lib.mkDefault true;

  myHomeManager.nvim.enable = lib.mkDefault true;
  myHomeManager.xdg.enable = lib.mkDefault true;
  myHomeManager.fonts.enable = lib.mkDefault true;
  myHomeManager.swaylock.enable = lib.mkDefault true;

  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORM = "wayland";
    QT_SCALE_FACTOR = "1.25";
  };

  home.packages = with pkgs; [
    nurl
    nix-search-cli

    qutebrowser
    chromium
    telegram-desktop
    discord
    grimblast
    pavucontrol
    overskride
  ];
}
