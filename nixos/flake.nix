{

  description = "Central configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/25.05";
  };
  
  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations.home = {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };

}
