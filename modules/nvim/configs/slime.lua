vim.g.slime_target = "tmux"

vim.g.slime_python_ipython = 0
vim.g.slime_bracketed_paste = 1 -- needed for ipython

vim.g.slime_paste_file = vim.fn.expand("$HOME/.tmp/slime_paste")

vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}

-- autocommand to delete slime cache file on exit
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("exit", {clear = true}),
    callback = function()
        vim.fn.delete(vim.g.slime_paste_file)
    end
})

