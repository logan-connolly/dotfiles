local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = ls.s
local i = ls.insert_node
local t = ls.text_node

ls.snippets = {
  lua = {
    s("sn", fmt("s('[]', fmt('[]', { [] })),", { i(1), i(2), i(0) }, { delimiters = '[]' })),
    s("sna", fmt("s('<>', fmt('<>', { <> }, { delimiters = '[]' })),", { i(1), i(2), i(0) }, { delimiters = '<>' })),
    s("req", fmt("local {} = require('{}')", { i(1), i(2) })),
  },
  make = {
    s('dir', {t('parent_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))')}),
    s('goal', {t('.DEFAULT_GOAL=help')}),
    s('help', {
      t({'help: # Show this help', "\t" }),
      t([[@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}']])
    }),
  },
  python = {
    s("lc", fmt('[{} for {} in {}]', { i(1, 'item'), rep(1), i(0, 'items') })),
    s("lci", fmt('[{} for {} in {} if {}]', { i(1, 'item'), rep(1), i(2, 'items'), i(0) })),
    s("sc", fmt('{[] for [] in []}', { i(1, 'item'), rep(1), i(0, 'items') }, { delimiters = '[]' })),
    s("sci", fmt('{[] for [] in [] if []}', { i(1, 'item'), rep(1), i(2, 'items'), i(0) }, { delimiters = '[]' })),
    s('dc', fmt('{[]: [] for [], [] in [].items()}', { i(1, 'k'), i(2, 'v'), rep(1), rep(2), i(0, 'd') }, { delimiters = '[]' })),
  }
}

-- Load 3rd party snippets
require('luasnip.loaders.from_vscode').load({ include = { 'html', 'css', 'javascript' }})
