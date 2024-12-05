{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # shell
      atuin
      btop
      procs
      thefuck
      tldr

      # text
      bat
      jq
      ripgrep
      yq

      # files
      broot
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
        top = "btop";
    };
  };

  programs = {
    atuin.enable = true;

    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
    };

    broot.enable = true;
    btop.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    eza.enable = true;
    fd.enable = true;

    fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'eza --tree {} | head -50'" ];
      defaultCommand = "fd --hidden --exclude '.git'";
      defaultOptions = [ ];
      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = [ "--preview 'bat --color=always {}'" ];
      tmux.enableShellIntegration = true;
    };

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
