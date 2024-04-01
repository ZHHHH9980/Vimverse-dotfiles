vim.opt.termguicolors = true

vim.keymap.set('n', '<C-x>', ':%bdelete<bar>edit#<bar>bdelete#<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-X>', ':bdelete<bar>bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'E', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'R', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

require("bufferline").setup {}
