local cmd = vim.api.nvim_command

function nvim_create_augroups(definitions)
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
    git_add_recolor = {
      { 'VimEnter', '*', [[hi diffAdded guifg=#9ece6a]]}
    };
    git_remove_recolor = {
      { 'VimEnter', '*', [[hi diffRemoved guifg=#f7768e]]}
    }
}

nvim_create_augroups(autocmds)
