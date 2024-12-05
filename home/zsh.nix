{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    autocd = true;
    enableCompletion = true;

    history = {
      append = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = config.home.shellAliases;

    zsh-abbr = {
      enable = true;
      abbreviations = config.programs.zsh.shellAliases;
    };

    plugins = [];
  };
}
