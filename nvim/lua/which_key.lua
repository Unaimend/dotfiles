


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.maplocalleader = ';'

require("which-key").setup {
  plugins = {
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false,-- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
      spelling = {
          enabled = true
      }
  },
  --ignore_missing = true,
    show_help = false,
      layout = {
        height = { min = 6, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 150 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
}

wk = require("which-key")
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})


wk.register({
  f = {
    name = "telescope", -- optional group name
    f = {builtin.find_files, "Find files" },
    l = {builtin.live_grep, "Live grep" },
    g = {builtin.git_files, "git find" },
  },
}, { prefix = "<leader>" })



wk.register({
  l = {
    name = "lsp", -- optional group name
    h = {':ClangdSwitchSourceHeader<CR>', 'toggle .h/.c' },
    d = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition'},
    D = {'<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to declaration"},
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code action" },
    s = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', "Doc s" },
    r = {'<cmd>lua vim.lsp.buf.references()<CR>', "References" },
    R = {'<cmd>lua vim.lsp.buf.rename()<CR>', "rename" },
    h = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', "rename" },

  },
}, { prefix = "<leader>" })



-- All keybings related to buffers
wk.register({
  b = {
       name = 'buffer' , 
       b = {':buffers<CR>'     , 'Show buffers'},
       --d = {':Bwipeout<CR>'     , 'Close current buffer'},
       n = {':bn<CR>'     , 'Go to next buffer'},
       p = {':bp<CR>'     , 'Go to previous buffer'},
       h = {':nohlsearch<CR>'     , 'Unlight search'},
     },
  }, { prefix = "<leader>" })
       


-- All keybings related to windows
wk.register({
  w  = {
    name = "window",
    p = {},
    h = { '<C-W>h', "go left"},
    j = { '<C-W>j', "go down"},
    k = { '<C-W>k', "go up"},
    l = { '<C-W>l', "go right"},
    s = { ':split<CR>', "split hor."},
    v = { ':vsplit<CR>', "split ver."},
    q = { ':q<CR>', "close window"},
    t = { ':set number!<CR>', "toogle line numbers"},
    r = {
      name = "resize",
      ["+"] = {':res +2<CR>', '+2' },
      ["-"] = {':res -2<CR>', '-2' }
    },

    f = {
      name = "fold",
      o = { ':foldopen<CR>', "open folds"},
      c = { ':foldclose<CR>', "close folds"},    
    },
  }
}, {prefix = "<leader>"})

-- R settings


wk.register({
  x = {':vs $MYVIMRC<CR>', "open vimrc"},
}, {prefix = "<leader>"})

wk.register({
  o = {
  function()
    local buf = vim.api.nvim_get_current_buf() 
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    vim.cmd(":w !octave --persist")
  end, "octave"
}
}, {prefix = "<leader>"})

function test()
  curr_path = vim.api.nvim_buf_get_name(0)
  print(curr_path)
  i = "rmarkdown::render(\\\"" ..curr_path .. "\\\")"
  str = ":call RAction(\"" .. i .. "\")"  
  print(str)
  vim.cmd(str)
end

function on_buffer_open()
  local filetype = vim.bo.filetype
  print(filetype)
  if filetype == "r" or filetype == "rmd"then
    wk.register({
        --t = { ':Lex 40<CR>', "Show left ex."},
        d = {'<Plug>RSendLine', "run Line"},
        r = { 
          name = "R",
          r = {'<Plug>RStart', "Start R"},
          c = {':call b:SendChunkToR("echo", "down")<CR>', "Clear R"},
          t = {':call RAction("tail")<CR>', "tail"},
          H = {':call RAction("head")<CR>', "head"}, --this should be ?
          h = {':call RAction("help")<CR>', "help"},
          v = {':call RAction("View")<CR>', "View"},
          o = {':call RObjBrowser()<CR>', "ObjBrow"},
          f = {'<Plug> RSendFile', "File"},
          p = {':call RMakeRmd("pdf_document")<CR>', "pdf"}
        },
        z = { ':ZoomToggle<CR>', "Zoom."},
    }, {prefix = "<leader>"})
  -- elseif filetype == "lua" then
  --     print("This is a Lua file.")
  --     -- Perform actions specific to Lua files
  --else
  --    print("This is a file of type:", filetype)
  --     -- Perform actions for other file types
  end
end

-- Attach the Lua function to the BufReadPost event
vim.api.nvim_exec([[
    augroup on_buffer_open_group
        autocmd!
        autocmd BufReadPost * lua on_buffer_open()
    augroup END
]], false)
