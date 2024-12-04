{ pkgs, ... }: {
  home.packages = with pkgs; [
    cookiecutter
    pdm
    pipx
    pre-commit
    pylyzer
    ruff
    uv
  ];

  programs = {
    poetry.enable = true;
    pyenv.enable = true;
  };
}
