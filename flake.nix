{
  description = "Base nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    emacs-src = {
      url = "github:aaronmiller/emacs/751a14a4d0407862967131829bd88aa9496f5b0b";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }:
  let
    mkDarwin = system: nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ({ pkgs, ... }: {
          nix.settings.cores = 0;
          nix.settings.max-jobs = "auto";
          nix.settings.experimental-features = "nix-command flakes";

          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 6;

          nixpkgs.hostPlatform = system;
          nixpkgs.config.allowUnfree = true;
        })
      ] ++ (import ./modules);
    };
  in
  {
    darwinConfigurations = {
      "base" = mkDarwin "x86_64-darwin";
      "base-arm" = mkDarwin "aarch64-darwin";
    };
  };
}
