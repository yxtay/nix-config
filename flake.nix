{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    determinate,
    nix-darwin,
    home-manager,
    mac-app-util,
    nix-homebrew,
    ...
  }: let
    system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin

    host = {
      name = "yx-tay-pkf2k";
    };

    user = {
      name = "yuxuantay";
      home = "/Users/${user.name}";
      email = "wyextay@gmail.com";
      workEmail = "tay.yuxuan@gt.tech.gov.sg";
    };

    specialArgs =
      inputs
      // {
        inherit host user;
      };
  in {
    # Nix Darwin configuration entrypoint
    # Available through 'nix run nix-darwin -- switch --flake .#simple'
    darwinConfigurations = {
      "${host.name}" = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;

        modules = [
          ./darwin

          determinate.darwinModules.default
          mac-app-util.darwinModules.default
          # https://github.com/zhaofengli/nix-homebrew
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = user.name;

              # Optional: Declarative tap management
              # taps = {
              # };

              # Optional: Enable fully-declarative tap management
              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
              mutableTaps = true;

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }

          # home manager
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
              users.${user.name} = import ./home;
            };
          }
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'nix run home-manager -- switch --flake .#simple'
    homeConfigurations = {
      "${user.name}" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance

        modules = [
          ./home
          mac-app-util.homeManagerModules.default
        ];
      };
    };

    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
