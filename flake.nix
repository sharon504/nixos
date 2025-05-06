{
  description = "Nixos config flake";

  inputs = {
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
       url = "github:hyprwm/hypridle";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:sharon504/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-ld, nixpkgs, ... }@inputs:
    let
      # system = "x86_64-linux";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs; inherit system;
        };
        modules = [
          ./hosts/default/configuration.nix
          ./modules/kanata
          nix-ld.nixosModules.nix-ld
          inputs.home-manager.nixosModules.default
          { programs.nix-ld.dev.enable = true; }
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "HMBackup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          }
        ];
      };
    };
}
