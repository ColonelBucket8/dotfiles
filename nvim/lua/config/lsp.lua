-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- Format on save
	-- Add the below lines to `on_attach`
	-- if client.resolved_capabilities.document_formatting then
	-- 	vim.api.nvim_command([[augroup Format]])
	-- 	vim.api.nvim_command([[autocmd! * <buffer>]])
	-- 	vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]])
	-- 	vim.api.nvim_command([[augroup END]])
	-- end
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- require('lspconfig')['diagnosticls'].setup {
--   on_attach = on_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       eslint_d = {
--         command = 'eslint_d',
--         args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'eslint_d',
--       javascriptreact = 'eslint_d',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'eslint_d',
--       typescriptreact = 'eslint_d',
--       markdown = 'prettier',
--     }
--   }
-- }

local servers = { "tsserver", "hls", "rust_analyzer" }
for _, server in pairs(servers) do
	require("lspconfig")[server].setup({
		on_attach = on_attach,
		flags = lsp_flags,
	})
end

require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
