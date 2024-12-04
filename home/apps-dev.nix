{ pkgs, ... }: {
  home.packages = with pkgs; [
    # terminals & editors
    helix
    micro
    nano
    neovim
    starship
    tmux
    vim
    vscode
    wezterm
    zsh

    # dev
    ansible
    direnv
    git
    gh
    lazygit
    mise
    nix-direnv
    ollama
    terraform

    # container
    docker
    docker-buildx
    docker-compose
    docker-credential-helpers
    lazydocker
    kubectl
    kubernetes-helm
    podman

    # python
    cookiecutter
    pdm
    pipx
    poetry
    pre-commit
    pylyzer
    ruff
    uv

    # work
    awscli
    azure-cli
    databricks-cli
    google-cloud-sdk
  ];
}
