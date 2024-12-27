{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nix-zsh-completions
    oh-my-zsh
    zsh
    # zsh-autocomplete
    zsh-autosuggestions
    zsh-completions
    zsh-fast-syntax-highlighting
    zsh-forgit
    zsh-fzf-tab
    zsh-history-substring-search
    # zsh-vi-mode
    zsh-you-should-use
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    autocd = true;
    enableCompletion = false; # disable for zsh-autocomplete
    historySubstringSearch.enable = true;
    # syntaxHighlighting.enable = true;

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
    };

    autosuggestion = {
      enable = true;
      strategy = ["match_prev_cmd" "history" "completion"];
    };

    shellAliases = config.home.shellAliases;
    # zsh-abbr = {
    #   enable = true;
    #   abbreviations = config.programs.zsh.shellAliases;
    # };

    oh-my-zsh = {
      enable = true;
      extraConfig = "";
      plugins = ["git"];
      theme = "";
    };

    plugins = with pkgs; [
      {
        # before zsh-autosuggestion and fast-syntax-highlighting
        name = "fzf-tab";
        src = "${zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "forgit";
        src = "${zsh-forgit}/share/zsh/zsh-forgit";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "you-should-use";
        src = "${zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
      # {
      #   name = "zsh-autocomplete";
      #   src = "${zsh-autocomplete}/share/zsh-autocomplete";
      # }
      # {
      #   name = "zsh-vi-mode";
      #   src = "${zsh-vi-mode}/share/zsh-vi-mode";
      # }
    ];
  };
}
