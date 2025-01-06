{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nix-zsh-completions
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-fast-syntax-highlighting
    zsh-forgit
    zsh-fzf-tab
    zsh-history-substring-search
    zsh-you-should-use
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    # zprof.enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = ["match_prev_cmd" "history" "completion"];
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
        name = "you-should-use";
        src = "${zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
    ];

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
    };
    autocd = true;

    initExtra = ''eval "$(brew shellenv 2>/dev/null || true)"'';
    shellAliases = config.home.shellAliases;

    # syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
  };
}
