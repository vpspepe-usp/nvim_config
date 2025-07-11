return {
  {
    "AckslD/nvim-pytrize.lua",
    -- uncomment if you want to lazy load
    cmd = { "Pytrize", "PytrizeClear", "PytrizeJump" },
    -- uncomment if you want to lazy load but not use the commands
    -- module = "pytrize",
    config = function()
      require("pytrize").setup { no_commands = false, highlight = "LineNr", preferred_input = "telescope" }
    end,
  },
}
