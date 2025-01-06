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

    defaultKeymap = "emacs";

    initExtraBeforeCompInit = ''
      ZSH_AUTOSUGGEST_MANUAL_REBIND=1
      ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
    '';

    # zprof.enable = true;
    enableCompletion = true;
    # autosuggestion = {
    #   enable = true;
    #   strategy = ["match_prev_cmd" "history" "completion"];
    # };

    plugins = with pkgs; [
      {
        name = "you-should-use";
        src = "${zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
      {
        name = "forgit";
        src = "${zsh-forgit}/share/zsh/zsh-forgit";
      }
      {
        # before zsh-autosuggestion and fast-syntax-highlighting
        name = "fzf-tab";
        src = "${zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-history-substring-search";
        src = "${zsh-history-substring-search}/share/zsh-history-substring-search";
      }
      {
        name = "zsh-autosuggestions";
        src = "${zsh-autosuggestions}/share/zsh-autosuggestions";
      }
    ];

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
    };
    autocd = true;

    initExtra = ''
      bindkey "^[[A" history-substring-search-up
      bindkey "^[[B" history-substring-search-down

      (( $+commands[brew] )) && eval "$(brew shellenv)"
    '';
    shellAliases = config.home.shellAliases;

    # syntaxHighlighting.enable = true;
    # historySubstringSearch.enable = true;
  };
}
