{ pkgs, user, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    "${user.name}" = {
      uid = user.uid;
      createHome = true;
      home = user.home;
      isHidden = false;
      shell = pkgs.zsh;
    };
  };
}
