{ pkgs, ... }: {
  home.packages = with pkgs; [
    # mac
    mas
    rectangle

    # communication
    slack
    zoom-us

    # entertainment
    spotify
  ];
}
