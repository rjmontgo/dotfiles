return {
  "ellisonleao/gruvbox.nvim",
  "sainnhe/everforest",
  "sainnhe/gruvbox-material",
  "EdenEast/nightfox.nvim",
  {
    "Shatur/neovim-ayu",
    config = function()
      local colors = require('ayu.colors')
      colors.generate() -- side effect 
      require('ayu').setup({
        overrides = {
          Normal = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorLineNr = { fg = colors.accent, bg = "None" },
          CursorColumn = { bg = "None" },
          WhichKeyFloat = { bg = "None" },
          VertSplit = { bg = "None" },
          LineNr = { fg = colors.fg },
          VimWikiLink = { fg = colors.tag, underline = true }
        },
      })
    end
  },
};
