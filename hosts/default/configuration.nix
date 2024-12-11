{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  security.polkit.enable = true;

  programs.dconf.enable = true;
  programs.xwayland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "alpha" = import ./home.nix;
    };
  };

  time.timeZone = "Asia/Kolkata";

  services.libinput.enable = true;
  services.openssh.enable = true;

  users.users.alpha = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
      kitty
      brightnessctl
      blueman
    ];
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    git
    gnumake
    cmake
    vimPlugins.telescope-fzf-native-nvim
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}

