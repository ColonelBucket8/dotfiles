local home = os.getenv('HOME')
local db = require('dashboard')

-- linux
db.preview_command = 'ueberzug'
--
db.preview_file_path = home .. '/Pictures/Wallpapers/anime-9.jpg'
db.preview_file_height = 11
db.preview_file_width = 50
db.custom_center = {
    {icon = '  ',
    desc = 'Recently latest session                 ',
    shortcut = '       ',
    action ='SessionLoad'},
    {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'browse oldfiles',
    shortcut = 'SPC s h'},
    {icon = '  ',
    desc = 'Find File                               ',
    action = 'Files',
    shortcut = 'SPC p f'},
    {icon = '  ',
    desc = 'File Browser                            ',
    action =  'NvimTreeToggle',
    shortcut = 'SPC o s'},
    {icon = '  ',
    desc = 'Find word                               ',
    action = 'Rg',
    shortcut = 'SPC p s'},
  }
