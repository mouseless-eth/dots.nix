{
  pkgs,
  lib,
  ...
}: {
  myNixOS.services.resolved.enable = true;

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.unbound.enable = true;
  programs.light.enable = true;
  security.rtkit.enable = true;
  security.pam.services.login.fprintAuth = false;

  services.mullvad-vpn.enable = true;
  services.getty.autologinUser = "mous";

  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka" "FiraCode"];})
    cm_unicode
    corefonts
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
    enable = true;
  };
}
