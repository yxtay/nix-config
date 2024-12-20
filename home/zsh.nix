{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zsh
    zsh-abbr
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
  ];

  programs.zsh = rec {
    enable = true;

    autocd = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
    };

    shellAliases = config.home.shellAliases;

    zsh-abbr = {
      enable = true;
      abbreviations = shellAliases;
    };

    plugins = [];
  };
}
