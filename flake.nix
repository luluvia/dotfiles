{
  description = "Yume - NixOS system configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    
    unstable.url = "nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkg.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" ];
      forEachSystem = f: nixpkgs.lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in {
      inherit lib;
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

      # Custom packages and modifications exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # Main desktop
        sudama = lib.nixosSystem {
          modules = [ ./hosts/sudama ];
          specialArgs = { inherit inputs outputs; };
        };
        # Laptop
        kodama = lib.nixosSystem {
          modules = [ ./hosts/kodama ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "luluyume@sudama" = lib.homeManagerConfiguration {
          modules = [ ./home/luluyume/sudama.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "luluyume@kodama" = lib.homeManagerConfiguration {
          modules = [ ./home/luluyume/kodama.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}
