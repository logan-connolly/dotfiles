local cmd = vim.api.nvim_command

local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        cmd('augroup '..group_name)
        cmd('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            cmd(command)
        end
        cmd('augroup END')
    end
end

local autocmds = {
    lua_highlight = {
      { 'TextYankPost', '*', [[silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=400}]] };
    };
    transparent_bg = {
      { 'ColorScheme', '*', [[hi Normal ctermbg=none guibg=none]]}
    };
    fugitive_diff_colors = {
      { 'VimEnter', '*', [[hi diffAdded guifg=#9ece6a]]},
      { 'VimEnter', '*', [[hi diffRemoved guifg=#f7768e]]}
    };
    ftplugin_settings = {
      { 'Filetype', 'dockerfile,lua,sh,zsh', [[setlocal tabstop=2 shiftwidth=2 expandtab]] },
      { 'Filetype', 'markdown', [[setlocal tabstop=2 shiftwidth=2 expandtab wrap linebreak]] }
    },
    autoformat_buffer = {
      { 'BufWritePost', '*.html,*.css,*.vue,*.js*,*.ts*,*.py,*.yaml,*.yml', [[FormatWrite]] }
    }
}

nvim_create_augroups(autocmds)
