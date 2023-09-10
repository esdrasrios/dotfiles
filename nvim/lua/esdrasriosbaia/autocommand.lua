local group = vim.api.nvim_create_augroup('Setup', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    callback = function()
        require('vim.highlight').on_yank { higroup = 'Substitute', timeout = 200 }
    end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, { command = 'set cursorline', group = group })
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, { command = 'set nocursorline', group = group })
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
    group = group,
    command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})
vim.api.nvim_create_autocmd('FileChangedShellPost', {
    group = group,
    command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
})
