-- GitFileUrl - Get URL of file in remote repository
vim.api.nvim_create_user_command('GitFileUrl', function(opts)
  local file = vim.fn.expand('%:p')
  if file == '' then
    vim.notify('No file', vim.log.levels.ERROR)
    return
  end

  local repo_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local rel_path = file:sub(#repo_root + 2)
  local remote = vim.fn.systemlist('git remote get-url origin')[1]
  local branch = vim.fn.systemlist('git branch --show-current')[1]

  -- SSH → HTTPS (GitHub-style)
  remote = remote:gsub('%.git$', '')
  remote = remote:gsub('^git@github.com:', 'https://github.com/')

  local url = string.format('%s/blob/%s/%s', remote, branch, rel_path)

  if opts.range > 0 then
    url = string.format('%s#L%d-L%d', url, opts.line1, opts.line2)
  end

  vim.fn.setreg('+', url)
  vim.notify('Copied: ' .. url)
end, { range = true })

-- vim: ts=2 sts=2 sw=2 et
