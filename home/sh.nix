{pkgs, config, ...}: {
  home = {
    packages = with pkgs; [
      # shell
      btop
      mcfly
      mcfly-fzf
      procs
      thefuck
      tlrc

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

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
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
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };

    direnv = {
      enable = true;
      mise.enable = true;
      nix-direnv.enable = true;
    };

    fzf = rec {
      enable = true;
      changeDirWidgetCommand = "fd --type d --hidden --exclude '.git'";
      changeDirWidgetOptions = ["--preview 'eza --tree --color=always --icons=always {} | head -200'"];
      defaultCommand = "";
      defaultOptions = [];
      fileWidgetCommand = "fd --hidden --exclude '.git'";
      fileWidgetOptions = ["--preview 'bat --color=always --line-range :500 {}'"];
      tmux.enableShellIntegration = true;
    };

    mcfly = {
      enable = true;
      fuzzySearchFactor = 2;
      fzf.enable = true;
    };

    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    mise.enable = true;
    nix-index.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    thefuck.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };
}