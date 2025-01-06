{...}: {
  programs = {
    # disable as much as possible
    bash.enable = false;
    zsh = {
      enable = true;
      enableBashCompletion = false;
      enableCompletion = false;
      promptInit = "";
    };
  };
}
