{pkgs, ...}: {
  home.packages = with pkgs; [
    # terminals & editors
    helix
    micro
    nano
    neovim
    starship
    tmux
    vim
    zsh

    # dev
    ansible
    direnv
    git
    gh
    mise
    nix-direnv
    ollama
    terraform

    # container
    # docker  # homebrew
    # docker-builx  # homebrew
    # docker-compose  # homebrew
    # docker-credential-helper  # homebrew
    # kubectl  # homebrew
    # kubernetes-helm  # homebrew
    # podman  # homebrew

    # python
    cookiecutter
    pdm
    pipx
    poetry
    pre-commit
    pylyzer
    ruff
    uv

    # mac
    mas

    # work
    awscli
    azure-cli
    codefresh
    databricks-cli
    google-cloud-sdk
  ];
}
