{
  pkgs,
  lib,
  ...
}: {
  myNixOS.sddm.enable = lib.mkDefault true;

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.unbound.enable = true;
  networking.networkmanager.enable = true;
  programs.light.enable = true;
  security.rtkit.enable = true;
  security.pam.services.login.fprintAuth = false;
  security.pam.services.swaylock = {};

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
