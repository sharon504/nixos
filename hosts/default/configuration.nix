{ config, pkgs, inputs, system, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
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
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [
      tree
      kitty
      brightnessctl
      spotify
      blueman
      neofetch
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
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
    # pulse.enable = true;
  };
  # services.pipewire.enable = true;
  # services.pipewire.alsa.enable = true;
  # services.pipewire.systemWide = true;

  environment.systemPackages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    nwg-look
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
    # pipewire
    # wireplumber
    blueman
    font-awesome
    wl-clipboard
    docker-compose
    dbeaver-bin
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}

