{user, ...}: {
  imports = [
    # ./networking.nix
    ./homebrew.nix
    ./nix-core.nix
    ./system.nix
  ];

  system.stateVersion = 5;

  time.timeZone = "Asia/Singapore";

  users.users = {
    "${user.name}" = {
      home = user.home;
    };
  };
}
