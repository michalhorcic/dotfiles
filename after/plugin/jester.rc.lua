require("jester").setup({
  cmd = "node --experimental-vm-modules --no-warnings ./node_modules/.bin/jest -t '$result' -- $file",
  dap = {
    console = "externalTerminal"
  }
})
