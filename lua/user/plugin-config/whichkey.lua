local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["c"] = { "<cmd>Bdelete<CR>", "Close Buffer" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"] = { "<cmd>q<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" },

  b = {
    name = "Buffer",
    h = {
      "<cmd>BufferLineMovePrev<cr>",
      "Move left",
    },
    l = {
      "<cmd>BufferLineMoveNext<cr>",
      "Move right",
    },
    s = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort buffers",
    },
  },

  f = {
    name = "find",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    ["t"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  },

  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "lsp",
    A = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
    R = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
    L = { "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>", "List Workspace Folders" },
    c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    D = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
}

which_key.setup()
which_key.register(mappings, opts)
