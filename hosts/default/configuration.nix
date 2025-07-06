{ config, pkgs, inputs, system, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ./programs.nix
    ];

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  security.polkit.enable = true;
  virtualisation.docker.enable = true;
  # programs.dconf.enable = true;
  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
    adb = {
      enable = true;
    };
    kdeconnect = {
      enable = true;
    };
  };
  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
    fira-sans
    font-awesome
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware = {
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    graphics = {
      enable = true;
    };
  };

  networking = {
    firewall = {
      enable = false;
      # allowedTCPPorts = [ 22 8081 ];
      # allowedUDPPorts = [ 8081 ];
    };
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "alpha" = import ../../modules/home-manager;
    };
  };

  time.timeZone = "Asia/Kolkata";

  services.libinput.enable = true;
  services.openssh.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  users.users.alpha = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "kvm" "adbusers" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [
      tree
      brightnessctl
      blueman
      neofetch
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
  };


  system.stateVersion = "24.05"; # Did you read the comment?
}

