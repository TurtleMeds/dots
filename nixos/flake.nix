{

  description = "Central configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgsUnstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, zen-browser, nixpkgsUnstable, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgsUnstable.legacyPackages.${system};
    in {
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./configuration.nix ];
    };

    homeConfigurations.turtle = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
      extraSpecialArgs = {
        inherit zen-browser;
        inherit pkgsUnstable;
      };
    };
  };

}
