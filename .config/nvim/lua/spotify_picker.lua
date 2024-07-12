local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local json = require "json"
local spotifyQueue = function(opts)
  opts = opts or {}
  vim.cmd('!spotify_player get key queue<CR><CR>')
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

spotifyQueue()
