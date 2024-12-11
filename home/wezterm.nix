{...}: {
  programs = {
    wezterm = {
      enable = false;

      extraConfig = ''
        return {
          color_scheme = "Dracula (Official)",
          font = wezterm.font "FiraCode Nerd Font",
          tab_bar_at_bottom = true,
          window_close_confirmation = "NeverPrompt",
          window_decorations = "RESIZE",
        }
      '';
    };
  };

  xdg.configFile."wezterm/wezterm.lua".text = ''
    local wezterm = require 'wezterm'

    return {
      color_scheme = "Dracula (Official)",
      font = wezterm.font "FiraCode Nerd Font",
      tab_bar_at_bottom = true,
      window_close_confirmation = "NeverPrompt",
      window_decorations = "RESIZE",
    }
  '';
}
