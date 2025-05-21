require("noice").setup({
  cmdline = {
    format = {
      cmdline = {
        view = "cmdline"
      },
      search_down = {
        view = "cmdline"
      },
      search_up = {
        view = "cmdline"
      },
    },
  },
  route = {{
    filter = {
      event = "msg_show",
      kind = "",
      find = "written",
    },
    opt = {
      skip = true
    },
  }}
})
