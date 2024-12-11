{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # shell
      btop
      mcfly
      procs
      thefuck
      tldr

      # text
      bat
      jq
      ripgrep
      yq

      # files
      dtrx
      duf
      dust
      eza
      fd
      fzf
      yazi
      zoxide

      # security
      gnupg
      openssh

      # data transfer
      curl
      httpie
      rclone
      rsync
    ];

    shellAliases = {
      d = "docker";
      g = "git";
      k = "kubectl";
      p = "podman";
      ".." = "z ..";
      cd = "z";
      cat = "bat";
    };
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
    };
    
    direnv = {
      enable = true;
      mise.enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type d --hidden --no-ignore --exclude '.git'";
      changeDirWidgetOptions = ["--preview 'eza --tree --color=always {} | head -50'"];
      defaultCommand = "fd --hidden --no-ignore --exclude '.git'";
      defaultOptions = [];
      fileWidgetCommand = "fd --type f --hidden --no-ignore --exclude '.git'";
      fileWidgetOptions = ["--preview 'bat --color=always {}'"];
      tmux.enableShellIntegration = true;
    };

    mcfly = {
      enable = true;
      fuzzySearchFactor = 2;
      fzf.enable = true;
    };

    starship = {
      enable = true;
      settings = {
        format = "$character";
        right_format = "$all";
      };
    };

    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    mise.enable = true;
    nix-index.enable = true;
    ripgrep.enable = true;
    thefuck.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };
}
