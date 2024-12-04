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
    asdf-vm
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

    # mac
    mas
    rectangle

    # communication
    slack
    zoom-us

    # entertainment
    spotify

    # work
    awscli
    azure-cli
    databricks-cli
    google-cloud-sdk
  ];
}