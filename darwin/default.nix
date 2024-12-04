{ ... }: {
  imports = [
    ./networking.nix
    ./homebrew.nix
    ./nix-core.nix
    ./system.nix
    ./users.nix
  ];

  system.stateVersion = 5;

  time.timeZone = "Asia/Singapore";
}
