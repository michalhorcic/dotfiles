if !exists('g:loaded_telescope') | finish | endif

nnoremap  <Leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <Leader>s <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
" nnoremap <Leader>a <Esc>:Telescope live_grep<space>
nnoremap <Leader>b <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>
nnoremap <Leader>z <cmd>lua require'telescope'.extensions.zoxide.list{}<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require'telescope'.load_extension('zoxide')
require("telescope").load_extension "file_browser"
EOF
