-- Float terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

require("lspsaga").setup({
	outline = {
		win_position = "left",
		win_with = "",
		win_width = 50,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "e",
			expand_collaspe = "i",
			quit = "q",
		},
	},
	move_in_saga = {
		prev = "<C-k>",
		next = "<C-j>",
	},
})
