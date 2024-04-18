{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;

  # js/ts
  home.sessionVariables.NPM_CONFIG_PREFIX = "$HOME/.local";
  home.sessionVariables.NODE_OPTIONS = "--max_old_space_size=8193";
  home.sessionVariables.BUN_INSTALL = "$HOME/.bun";
  home.sessionVariables.PATH = "$HOME/.local/bin:$HOME/.huff/bin:$HOME/.bun/bin:$PATH";

  # rust
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  home.sessionVariables.OPENSSL_DEV = pkgs.openssl.dev;
  home.sessionVariables.LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

  # evm related
  home.sessionVariables.milady = "milady";
  home.sessionVariables.FLAKE = "/home/mous/.snowstorm";
  home.sessionVariables.DETERMINISTIC_DEPLOYER = "0x4e59b44847b379578588920ca78fbf26c0b4956c";

  home.packages = with pkgs; [
    # misc (tools)
    pipx
    lazydocker
    doppler
    docker
    docker-compose
    kubectl
    doctl
    doppler
    gnupg
    nix-init
    zed-editor
    nh

    # git
    gh
    lazygit
    gh-copilot
    act

    lz4
    wget
    radeontop
    ocl-icd

    # make
    gnupg
    gnumake
    cmake
    clang
    llvmPackages.libclc
    libcxxStdenv

    # ts/js
    deno
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
    openssl

    # other langs
    #python3Full
    python312Packages.pip
    python312Packages.virtualenv
    chatgpt-cli
  ];
}
