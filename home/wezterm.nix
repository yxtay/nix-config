{ ... }: {
  programs = {
    wezterm = {
      enable = true;

      extraConfig = ''
        return {
          color_scheme = "Dracula",
          front_end = "WebGpu"
        }
      '';
    };
  };
}
