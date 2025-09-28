return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pylsp", "clangd", "phpactor" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({})
			-- lspconfig.pylsp.setup({})
			-- lspconfig.clangd.setup({})
			local servers = {
				lua_ls = {},
				pylsp = {},
				clangd = {},
				phpactor = {
					cmd = { "phpactor", "language-server", "-vvv" },
					filetypes = { "php" },
				},
			}
			for server, settings in pairs(servers) do
				vim.lsp.config(server, settings)
				vim.lsp.enable(server)
			end
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, { desc = "LSP Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
