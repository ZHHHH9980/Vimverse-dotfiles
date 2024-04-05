local builtin = require('telescope.builtin')

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }


vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Add custom arguments
table.insert(vimgrep_arguments, "--hidden")   -- Search in hidden/dot files
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*") -- Exclude `.git` directory

telescope.setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep({
    prompt_title = 'Search in Files',
    default_text = vim.fn.expand('<cword>'),
    layout_strategy = 'horizontal',
    layout_config = {
      vertical = {
        width = 0.6,
      },
    },
  })
end)


vim.keymap.set('n', '<C-p>', function()
  builtin.find_files({
    find_command = { 'ag', '--hidden', '--ignore', '.git', '--ignore', 'node_modules', '-g', '' },
    layout_strategy = 'horizontal',
    layout_config = {
      vertical = {
        width = 0.6,
      },
    },
  })
end)





vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({
    layout_strategy = 'horizontal',
    layout_config = {
      vertical = {
        width = 0.6,
      },
    },
    prompt_title = 'Search Files in Git Repository',
    show_untracked = true,
  })

  -- vim.keymap.set('n', '<leader>ps', function()
  --   builtin.grep_string({
  --     search = vim.fn.input("Grep > "),
  --     vimgrep_arguments = {
  --       'rg',
  --       '--color=never',
  --       '--no-heading',
  --       '--with-filename',
  --       '--line-number',
  --       '--column',
  --       '--smart-case',
  --       '--hidden',
  --       '-g',
  --       '!.git',
  --       '-g',
  --       '!node_modules',
  --     },
  --   })
  -- end)
  --
  -- vim.keymap.set('n', '<C-p>', function()
  --   builtin.find_files({
  --     find_command = { 'rg', '--files', '--hidden', '-g', '!.git', '-g', '!node_modules' },
  --     layout_strategy = 'horizontal',
  --     layout_config = {
  --       vertical = {
  --         width = 0.6,
  --       },
  --     },
  --   })
end)
