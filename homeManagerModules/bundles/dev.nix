{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;

  # rust
  home.sessionVariables.milady = "milady";
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  home.sessionVariables.OPENSSL_DEV = pkgs.openssl.dev;

  home.packages = with pkgs; [
    # misc
    lazygit
    lazydocker
    docker
    docker-compose

    # ts/js
    nodePackages_latest.pnpm
    nodejs_21

    # evm
    foundry-bin

    # rust
    pkg-config
    openssl.dev
    rustup
    openssl
  ];
}
