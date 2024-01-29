{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [inputs.foundry.overlay];
    config = {
      allowUnfree = true;
      experimentalFeatures = "nix-command flakes";
    };
  };

  programs.home-manager.enable = true;
  myHomeManager.hyprland.enable = lib.mkDefault true;

  myHomeManager.kitty.enable = lib.mkDefault true;
  myHomeManager.starship.enable = lib.mkDefault true;
  myHomeManager.fish.enable = lib.mkDefault true;
  myHomeManager.custom-scripts.enable = true;

  home.packages = with pkgs; [
    fzf
    htop
    lf
    eza
    fd
    jq
    ripgrep
    neofetch
  ];
}
