{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;

  # js/ts
  home.sessionVariables.NPM_CONFIG_PREFIX = "$HOME/.local";

  # rust
  home.sessionVariables.milady = "milady";
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  home.sessionVariables.OPENSSL_DEV = pkgs.openssl.dev;
  home.sessionVariables.LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

  home.packages = with pkgs; [
    # misc (tools)
    lazygit
    lazydocker
    docker
    docker-compose

    # make
    gcc
    gnumake
    cmake
    llvmPackages.libclc
    libcxxStdenv

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
