local wk = require("which-key")

wk.register({
  f = {
    name = "file",
    s = { "<Cmd>update<CR>", "Save" },
  },
}, { prefix = "<leader>" })

