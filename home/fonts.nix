{ pkgs, ... }: {
  home.packages = with pkgs.nerd-fonts; [
    symbols-only
    fira-code
    jetbrains-mono
    roboto-mono
    sauce-code-pro
  ];
}
