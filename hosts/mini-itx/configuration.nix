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
    #services.reth.enable = true;

    #power-management.enable = true;
    pipewire.enable = true;

    userName = "mous";
    userConfig = ./home.nix;
    userNixosSettings = {
      extraGroups = ["networkmanager" "wheel" "libvirtd" "docker" "audio" "video"];
    };
  };

  virtualisation.docker.enable = true;

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  users.users.mous.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJX1aaXfCcqZ1mSmnFvfslKCvdE5oAcEs7/J/bQrERYn 97399882+mouseless-eth@users.noreply.github.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKrBQFkxipTlhXWyUdxoUcjPdWHCetNFlSYFN7NTs9DM"
  ];

  networking.hostName = "mini-itx";
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  boot = {
    kernelModules = ["amdgpu"];
    loader.grub = {
      enable = true;
      device = "/dev/nvme1n1";
    };
  };

  fileSystems = {
    "/mount/nvme0n1-2tb" = {
      device = "/dev/disk/by-uuid/b12343e8-172e-45af-ac13-d64088bd0d2b";
      fsType = "ext4";
      depends = [
        "/"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /mount/nvme0n1-2tb 0777 root root -"
  ];

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
