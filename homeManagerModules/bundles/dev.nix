{
  lib,
  pkgs,
  ...
}: let
  #nix-alien-pkgs =
  #  import
  #  (
  #    builtins.fetchTarball "https://github.com/thiagokokada/nix-alien/tarball/master"
  #  )
  #  {};
in {
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;

  # js/ts
  home.sessionVariables.NPM_CONFIG_PREFIX = "$HOME/.local";
  home.sessionVariables.NODE_OPTIONS = "--max_old_space_size=8193";
  home.sessionVariables.PATH = "$HOME/.local/bin:$HOME/.huff/bin:$PATH";

  # rust
  home.sessionVariables.milady = "milady";
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  home.sessionVariables.OPENSSL_DEV = pkgs.openssl.dev;
  home.sessionVariables.LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

  home.packages = with pkgs; [
    # misc (tools)
    lazygit
    lazydocker
    doppler
    docker
    docker-compose
    kubectl
    doctl
    doppler
    gnupg

    lz4
    wget
    radeontop
    ocl-icd
    #nix-alien-pkgs.nix-alien

    # make
    gnupg
    gnumake
    cmake
    clang
    llvmPackages.libclc
    libcxxStdenv

    # ts/js
    nodePackages_latest.yarn
    nodePackages_latest.pnpm
    #nodejs_18.pkgs.pnpm
    nodejs_18
    bun

    # evm
    foundry-bin
    solc

    # rust
    pkg-config
    openssl.dev
    rustup
    #rust-analzyer
    openssl
  ];
}
