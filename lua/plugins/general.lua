return {
  -----------------------------------------------------------------------------
  -- TPOPE STACK (Standard Vim Enhancements)
  -----------------------------------------------------------------------------
  { 'tpope/vim-vinegar' },  -- Enhanced netrw
  { 'tpope/vim-surround' }, -- Consider 'kylechui/nvim-surround' for a Lua version
  { 'tpope/vim-repeat' },
  { 'tpope/vim-sensible' },
  { 'tpope/vim-fugitive' }, -- Git
  { 'tpope/vim-rhubarb' },  -- GitHub
  { 'tpope/vim-obsession' },
  {
    'dhruvasagar/vim-prosession',
    dependencies = { 'tpope/vim-obsession' }
  },

  -----------------------------------------------------------------------------
  -- UI & SEARCH
  -----------------------------------------------------------------------------
  {
    'mileszs/ack.vim',
    cmd = "Ack"
  },
  {
    'scrooloose/nerdcommenter',
    -- Note: Most Neovim users switch to 'numToStr/Comment.nvim'
  },
  {
    'moll/vim-bbye',
    cmd = "Bdelete"
  },
  {
    'junegunn/fzf',
    build = "./install --bin",
  },
  -- If you still want the legacy FZF commands (Native LSP uses Telescope instead)
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }
  },

  -- Airline (Status Line)
  -- Note: 'nvim-lualine/lualine.nvim' is the modern standard for Native LSP
  {
    'vim-airline/vim-airline',
    dependencies = {
      'vim-airline/vim-airline-themes',
      'edkolev/tmuxline.vim'
    },
    config = function()
      -- Put your let g:airline_... settings here if needed
      vim.g.airline_theme = 'dark' -- Example
    end
  },

  -- Nav
  { 'intrntbrn/awesomewm-vim-tmux-navigator' },
  {
    'preservim/tagbar',
    cmd = "TagbarToggle"
  },

  -----------------------------------------------------------------------------
  -- WIKI & TASK MANAGEMENT
  -----------------------------------------------------------------------------
  {
    'vimwiki/vimwiki',
    init = function()
      vim.g.vimwiki_list = { { path = '~/vimwiki/', syntax = 'markdown', ext = '.md' } }
    end,
    ft = { "vimwiki", "markdown" }
  },
  {
    'tools-life/taskwiki',
    ft = "markdown",
    dependencies = { 'vimwiki/vimwiki', 'farseer90718/vim-taskwarrior' }
  },
  { 'itchyny/calendar.vim',                  cmd = "Calendar" },
  { 'powerman/vim-plugin-AnsiEsc',           ft = "markdown" },
  { 'farseer90718/vim-taskwarrior',          ft = "markdown" },

  -----------------------------------------------------------------------------
  -- AUDIO / MUSIC
  -----------------------------------------------------------------------------
  {
    'supercollider/scvim',
    ft = "supercollider"
  },
  {
    'tidalcycles/vim-tidal',
    ft = "tidal"
  },

  -----------------------------------------------------------------------------
  -- LANGUAGE SPECIFIC
  -----------------------------------------------------------------------------
  {
    'WolfgangMehner/bash-support',
    ft = "sh"
  },
  -- Replaced by Treesitter, but keeping if you need specific features
  {
    'leafOfTree/vim-svelte-plugin',
    ft = "svelte"
  },

  -----------------------------------------------------------------------------
  -- AI
  -----------------------------------------------------------------------------
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to whatever you want for codeium accept
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end
  }
}
