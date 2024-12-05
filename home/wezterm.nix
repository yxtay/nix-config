{...}: {
  programs = {
    wezterm = {
      enable = false;

      extraConfig = ''
        return {
          color_scheme = "Dracula (Official)",
          front_end = "WebGpu"
        }
      '';
    };
  };

  xdg.configFile."wezterm/wezterm.lua".text = ''
    local wezterm = require 'wezterm'

    return {
      color_scheme = "Dracula (Official)",
    }
  '';
}
