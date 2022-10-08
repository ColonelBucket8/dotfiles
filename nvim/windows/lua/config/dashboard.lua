-- local home = os.getenv('HOME')
local db = require('dashboard')

db.preview_command = 'cat'
-- linux
-- db.preview_command = 'ueberzug'
-- [[
vim.cmd([[
let g:dashboard_custom_header =  [
      \'             ▄▄▀▀▀▀▀▀▀▀▄▄              ',
      \'          ▄▀▀            ▀▄▄           ',
      \'        ▄▀                  ▀▄         ',
      \'       ▌             ▀▄       ▀▀▄      ',
      \'      ▌                ▀▌        ▌     ',
      \'     ▐                  ▌        ▐     ',
      \'     ▌▐    ▐    ▐       ▌         ▌    ',
      \'    ▐ ▌    ▌  ▐ ▌      ▐       ▌▐ ▐    ',
      \'    ▐ ▌    ▌▄▄▀▀▌▌     ▐▀▌▀▌▄  ▐ ▌ ▌   ',
      \'     ▌▌    ▐▀▄▌▌▐▐    ▐▐▐ ▐ ▌▌ ▐ ▌▄▐   ',
      \'   ▄▀▄▐    ▌▌▄▀▄▐ ▌▌ ▐ ▌▄▀▄ ▐  ▐ ▌ ▀▄  ',
      \'  ▀▄▀  ▌  ▄▀ ▌█▐  ▐▐▀   ▌█▐ ▀▄▐ ▌▌   ▀ ',
      \'   ▀▀▄▄▐ ▀▄▀ ▀▄▀        ▀▄▀▄▀ ▌ ▐      ',
      \'      ▀▐▀▄ ▀▄        ▐      ▀▌▐        ',
      \'        ▌ ▌▐ ▀              ▐ ▐        ',
      \'        ▐ ▐ ▌    ▄▄▀▀▀▀▄    ▌ ▐        ',
      \'         ▌▐ ▐▄   ▐     ▌  ▄▀  ▐        ',
      \'        ▐  ▌▐▐▀▄  ▀▄▄▄▀ ▄▀▐   ▐        ',
      \'        ▌▌ ▌▐ ▌ ▀▄▄    ▄▌▐ ▌  ▐        ',
      \'       ▐ ▐ ▐▐ ▌    ▀▀▄▀▌▐  ▌  ▌        ',
      \'       ▌  ▌▐ ▌        ▐▀▄▌ ▐           ',
      \]
]])
--]]
db.preview_file_path = 'C:\\Users\\freed\\AppData\\Local\\nvim\\lua\\config\\dashboard.cat'
db.preview_file_height = 20
db.preview_file_width = 50
db.custom_center = {
    {icon = '  ',
    desc = 'Recently latest session                 ',
    shortcut = '       ',
    action ='SessionLoad'},
    {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'browse oldfiles',
    shortcut = '       '},
    {icon = '  ',
    desc = 'Find File                               ',
    action = 'Files',
    shortcut = 'CTRL p'},
    {icon = '  ',
    desc = 'File Browser                            ',
    action =  'NvimTreeToggle',
    shortcut = 'CTRL a'},
    {icon = '  ',
    desc = 'Find word                                ',
    action = 'Rg',
    shortcut = 'SPC f'},
  }
