{ config, lib, pkgs, inputs, system, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  security.polkit.enable = true;

  # programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland = {
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

  users.users.alpha = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [
      tree
      kitty
      brightnessctl
      spotify
      blueman
    ];
  };

  environment.systemPackages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    git
    gnumake
    cmake
    vimPlugins.telescope-fzf-native-nvim
    unzip
    nodejs
    inputs.zen-browser.packages."${system}".default
    python3
    pulseaudioFull
    pavucontrol
    pamixer
    blueman
    font-awesome
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}

