local M = {}

local build_hooks = {
['telescope-fzf-native.nvim'] = function(path)
	vim.system({ 'make'}, {cwd = path })
end,
}

vim.api.nvim_create_autocmd('PackChanged', {
	group = vim.api.nvim_create_augroup('pack-build-hooks', { clear = true }),
	callback = function(ev)
		local kind = ev.data.kind
		if kind ~= 'install' and kind ~= 'update' then 
			return
		end
		local hook = build_hooks[ev.data.spec.name]
		if hook then 
			hook(ev.data.path)
		end
	end,
})

--- Add (install if needed + load) plugins without the interactive confirm prompt
--- @param specs (string|table)[] `vim.pack.add` specs
function M.add(specs)
	vim.pack.add(specs, { confirm = false })
end

--- Shorthand for a GitHub source URL: gh('user/repo') -> full https URL
--- @param repo string "user/repo"
--- @return string
function M.gh(repo) return 'https://github.com/' .. repo end

return M
