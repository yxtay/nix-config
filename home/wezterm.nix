{ ... }: {
  programs = {
    wezterm = {
      enable = true;

      extraConfig = ''
        return {
          color_scheme = "Dracula (Official)",
          front_end = "WebGpu"
        }
      '';
    };
  };
}
