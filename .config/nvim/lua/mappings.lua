require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<A-Up>", ":m-2<CR>", { desc = "move one line up" })
map("n", "<A-Down>", ":m+1<CR>", { desc = "move one line down" })
-- Telescope mappings
map("n", "<leader><leader>", ":Telescope live_grep<CR>", { desc = "live grep working directory" })

-- LazyGit
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open Git" })
-- FTerm
map("n", "<leader>tt", function ()
  local fterm = require"FTerm"
  fterm.toggle()
end, { desc = "toggle floating terminal" })
map("n", "<leader>cle", ":Telescope quickfix<CR>")
map("n", "<leader>cc", ":cclose<CR>", { desc = "close quickfix" })
map("n", "<C-.>", "<Cmd>NvimTreeToggle<CR>", { desc = "toggle folder treeview "})
map("n", "<leader>st", "<Cmd>!spotify_player playback play-pause<CR><CR>", { desc = "toggle spotify playback"})
map("n", "<leader>sn", "<Cmd>!spotify_player playback next<CR><CR>", { desc = "spotify next track"})
map("n", "<leader>sp", "<Cmd>!spotify_player playback previous<CR><CR>", { desc = "spotify previous track"})
local fterm = require "FTerm"
local spotify_term = fterm:new({
  ft = "spotify",
  cmd = "spotify_player",
  dimensions = {
    width = 0.9,
    height = 0.9
  }
})
local function openSpotify()
  spotify_term:toggle()
end
map("n", "<leader>ss", openSpotify, { desc = "open spotify" })
