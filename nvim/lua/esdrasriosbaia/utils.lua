local M = {}

local function unload_all_modules()
    local unload_modules = {
        '^esdrasriosbaia.',
    }

    for k, _ in pairs(package.loaded) do
        for _, v in ipairs(unload_modules) do
            if k:match(v) then
                package.loaded[k] = nil
                break
            end
        end
    end
end

function M.reload()
    vim.cmd.LspStop()
    vim.fn.execute 'silent !pkill -9 eslint_d'
    unload_all_modules()
    vim.cmd.luafile '$MYVIMRC'
end

function M.restart()
    M.reload()
    vim.cmd.doautocmd 'VimEnter'
end

function M.clear()
    vim.lsp.buf.clear_references()
    vim.cmd.nohlsearch()

    local ignored_filetypes = { 'noice' }

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local status, config = pcall(vim.api.nvim_win_get_config, win)
        local bufnr = vim.fn.winbufnr(win)
        local buf_filetype = vim.fn.getbufvar(bufnr, '&filetype')
        if config and config.relative ~= '' and not vim.tbl_contains(ignored_filetypes, buf_filetype) then
            vim.api.nvim_win_close(win, false)
        end
    end
end

return M
