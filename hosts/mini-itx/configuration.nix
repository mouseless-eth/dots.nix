{
  conifg,
  pkgs,
  lib,
  inputs,
  outputs,
  sytsem,
  myLib,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  myNixOS = {
    bundles.general-desktop.enable = true;
    bundles.home-manager.enable = true;

    #power-management.enable = true;
    pipewire.enable = true;

    userName = "mous";
    userConfig = ./home.nix;
    userNixosSettings = {
      extraGroups = ["netwrokmanager" "wheel" "docker"];
    };
  };

  networking.hostName = "mini-itx";

  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  boot = {
    kernelModules = ["amdgpu"];
    loader.grub = {
      enable = true;
      device = "/dev/nvme1n1";
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;

  programs.kdeconnect.enable = true;
  programs.fish.enable = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [amdvlk];
    };
  };

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  system.stateVersion = "23.11";
}
