-- Float terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

require("lspsaga").setup({
	outline = {
		win_position = "left",
	},
	move_in_saga = {
		prev = "<C-k>",
		next = "<C-j>",
	},
})
