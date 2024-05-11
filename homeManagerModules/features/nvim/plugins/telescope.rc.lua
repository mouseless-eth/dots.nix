local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				previewer = false,
				initial_mode = "normal",
				-- sorting_strategy = "ascending",
				-- layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						width = 0.5,
						height = 0.4,
						preview_width = 0.6,
					},
				},
			}),
		},
	},
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
})

require("telescope").load_extension("ui-select")

vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep()
end)
vim.keymap.set("n", ";q", function()
	builtin.resume()
end)
vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)
vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
	builtin.resume()
end)
vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", ";g", function()
	builtin.git_commits()
end)
