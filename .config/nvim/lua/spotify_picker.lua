local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local json = require "json"
local spotifyQueue = function(opts)
  opts = opts or {}
  local nextSongs = {}
  local cmdText = "!timeout 5 spotify_player get key queue | jq .queue[].name -r"
  local results = vim.api.nvim_exec2(cmdText, { output = true })["output"]
  for row in string.gmatch(results, "[^\n]+") do
    table.insert(nextSongs, row)
  end
  table.remove(nextSongs, 1)
  print(vim.inspect(nextSongs))
  pickers.new(opts, {
      prompt_title = "spotify player",
      finder = finders.new_table {
        results = nextSongs
      },
      sorter = conf.generic_sorter(opts),
    }):find()
end

spotifyQueue()
