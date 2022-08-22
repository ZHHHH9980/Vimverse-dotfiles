local map = vim.api.nvim_set_keymap


-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- js snippets
map("i", "co ", "const", opt)
map("i", "im ", "import", opt)
map("i", "de ", "default", opt)
map("i", "rn ", "return", opt)
map("i", "ex ", "export", opt)

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
 
-- replace
map("n", "riw", "ciw<C-r>0<ESC>", opt)
map("n", "ri(", "ci(<C-r>0<ESC>", opt)
map("n", "ri{", "ci{<C-r>0<ESC>", opt)
map("n", "ri\"", "ci\"<C-r>0<ESC>", opt)
map("n", "ri\'", "ci\'<C-r>0<ESC>", opt)

map("n", "rr", "cc<C-r>0<ESC>", opt)

map("n", "d", "\"ad", opt)
map("n", "ndd", "\"add", opt)

map("n", "ncc", "\"acc", opt)
map("n", "cc", "\"acc", opt)
map("n", "c", "\"ac", opt)

-- save register <a>
-- visual mode replacement
map("v", "r", "p", opt)
-- delete
map("v", "nd", "\"ad", opt)
map("v", "d", "\"ad", opt)
map("v", "nc", "\"ac", opt)
map("v", "c", "\"ac", opt)

-- 上下滚动浏览
map("n", "K", "5j", opt)
map("n", "I", "5k", opt)
map("v", "K", "5j", opt)
map("v", "I", "5k", opt)

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- leader + hl  窗口之间跳转
map("n", "<leader>j", "<C-w>h", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- 左右比例控制
map("n", "<Left>", ":vertical resize +2<CR>", opt)
map("n", "<Right>", ":vertical resize -2<CR>", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- bufferline
-- 左右Tab切换
map("n", "E", ":BufferLineCyclePrev<CR>", opt)
map("n", "R", ":BufferLineCycleNext<CR>", opt)
map("n", ">>", ":BufferLineMoveNext<CR>", opt)
map("n", "<<", ":BufferLineMovePrev<CR>", opt)
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1", opt)
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2", opt)
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3", opt)
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4", opt)
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5", opt)


-- 关闭
--"moll/vim-bbye"
map("n", "<C-x>", ":Bdelete<CR>", opt)


-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "B", ":NvimTreeToggle<CR>", opt)

-- ranger
map("n", "<leader>R", ":RnvimrToggle<CR>", opt)

-- fzf
map("n","<C-p>",":Files<CR>",opt)
-- 全局搜索
map("n", "<C-f>", ":Rg<CR>", opt)

-- nvim-cmp 自动补全
--pluginKeys.cmp = function(cmp)
    --return {
        ---- 出现补全
        ---- ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ---- 取消
        --["<Esc>"] = cmp.mapping({
            --i = cmp.mapping.abort(),
            --c = cmp.mapping.close()
        --}),
        ---- 上一个
        --["<C-i>"] = cmp.mapping.select_prev_item(),
        ---- 下一个
        --["<C-k>"] = cmp.mapping.select_next_item(),
        ---- 确认
        --["<CR>"] = cmp.mapping.confirm({
            --select = true,
            --behavior = cmp.ConfirmBehavior.Replace
        --}),
        ---- 如果窗口内容太多，可以滚动
        ----["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ----["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    --}
--end

---- lsp 回调函数快捷键设置
--pluginKeys.mapLSP = function(mapbuf)
  ---- rename
  --mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  ---- code action
  --mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  ---- go xx
  --mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  --mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  ---- diagnostic
  --mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  --mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  --mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
--end



-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },

  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys


