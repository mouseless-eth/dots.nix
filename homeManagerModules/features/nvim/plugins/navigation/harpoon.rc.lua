local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = false,
		save_on_change = true,
		excluded_filetypes = { "harpoon" },
		mark_branch = true,
	},
})

-- stylua: ignore start
vim.keymap.set("n", ",ha", function() harpoon:list():add() end)
vim.keymap.set("n", ",hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", ",h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", ",h2", function() harpoon:list():select(2) end)
vim.keymap.set("n", ",h3", function() harpoon:list():select(3) end)
vim.keymap.set("n", ",h4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", ",o", function() harpoon:list():prev() end)
vim.keymap.set("n", ",i", function() harpoon:list():next() end)
-- stylua: ignore end

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", ";h", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
