{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    cantarell-fonts
    dejavu_fonts
    source-code-pro # Default monospace font in 3.32
    source-sans
    font-awesome_5

    joypixels
    noto-fonts-color-emoji
    fira-code-nerdfont
    noto-fonts
    nerdfonts
    noto-fonts-emoji
    terminus-nerdfont
    hackgen-nf-font
    swaycons
  ];

  nixpkgs.config.joypixels.acceptLicense = true;
}
