if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "heex",
    "elixir",
    "swift",
    "html",
    "scss"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.cpon = {
		install_info = {
			url = "~/projects/tree-sitter-cpon",
			files = {"src/parser.c"},
      generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false -- if folder contains pre-generated src/parser.c
		},
		filetype = "cpon", -- if filetype does not agrees with parser name
		used_by = {"cpon"} -- additional filetypes that use this parser
	}

parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
