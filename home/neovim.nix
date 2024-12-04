{ pkgs, ... }: {
  # https://discourse.nixos.org/t/neovim-and-nixos-star-crossed-lovers/25568
  # https://nixalted.com/
  # https://github.com/LazyVim/LazyVim/discussions/1972
  programs.neovim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages =  with pkgs; [
      # LazyVim
      lua-language-server
      stylua
      # Telescope
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
      which-key-nvim
      telescope-nvim
      nvim-lspconfig
      nvim-cmp
      conform-nvim
      tokyonight-nvim
      mini-nvim
      nvim-treesitter.withAllGrammars

      LazyVim
      bufferline-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      dashboard-nvim
      dressing-nvim
      flash-nvim
      friendly-snippets
      indent-blankline-nvim
      lualine-nvim
      neo-tree-nvim
      neoconf-nvim
      neodev-nvim
      noice-nvim
      nui-nvim
      nvim-lint
      nvim-notify
      nvim-spectre
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-ts-autotag
      nvim-ts-context-commentstring
      nvim-web-devicons
      persistence-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      todo-comments-nvim
      trouble-nvim
      vim-illuminate
      vim-startuptime
      { name = "LuaSnip"; path = luasnip; }
      { name = "catppuccin"; path = catppuccin-nvim; }
      { name = "mini.ai"; path = mini-nvim; }
      { name = "mini.bufremove"; path = mini-nvim; }
      { name = "mini.comment"; path = mini-nvim; }
      { name = "mini.indentscope"; path = mini-nvim; }
      { name = "mini.pairs"; path = mini-nvim; }
      { name = "mini.surround"; path = mini-nvim; }

      lazydev-nvim
      luvit-meta
      nvim-snippets
      snacks-nvim
      ts-comments-nvim

      nix-vim
    ];
  };
}