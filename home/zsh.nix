{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nix-zsh-completions
    zsh
    zsh-abbr
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
  ];

  programs.zsh = {
    enable = true;

    autocd = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

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

    zsh-abbr = {
      enable = true;
      abbreviations = config.programs.zsh.shellAliases;
    };

    plugins = with pkgs; [
      {
        name = "zsh-completions";
        src = zsh-completions.src;
      }
    ];
  };
}
