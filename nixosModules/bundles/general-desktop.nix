{
  pkgs,
  lib,
  ...
}: {
  myNixOS.sddm.enable = lib.mkDefault true;

  programs.light.enable = true;
  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka" "FiraCode"];})
    cm_unicode
    corefonts
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
    enable = true;
    #defaultFonts = {
    #  monospace = ["JetBrainsMono Nerd Font Mono"];
    #  sansSerif = ["JetBrainsMono Nerd Font"];
    #  serif = ["JetBrainsMono Nerd Font"];
    #};
  };
}
