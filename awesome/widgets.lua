local vicious = require("vicious")
local awful = require("awful")
local wibox = require("wibox")


local widgets = {}

-- Vicious widgets
    -- Memory Widget
function widgets.mem()
    memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    return vicious.register(memwidget, vicious.widgets.mem, "MEM $2MiB|$3MiB ", 2)
end

-- Disk Widget
function widgets.disk()
     diskwidget = wibox.widget.textbox()
     vicious.cache(vicious.widgets.fs)
     return vicious.register(diskwidget, vicious.widgets.fs, "ROOT ${/ avail_gb} GiB ", 2)
 end

-- CPU Widget Graph
function widgets.cpuGraph()
     cpuwidget = awful.widget.graph()
     cpuwidget:set_width(50)
     cpuwidget:set_background_color"#494B4F"
     cpuwidget:set_color{ type = "linear", from = { 0, 0 }, to = { 50, 0 },
                          stops = { { 0, "#FF5656" },
                                             { 0.5, "#88A175" },
                                                            { 1, "#AECF96" } } 
             }
end

-- CPU Widget
function widgets.cpu()
     cpuwidgetText = wibox.widget.textbox()
     vicious.cache(vicious.widgets.fs)
     return vicious.register(cpuwidgetText, vicious.widgets.cpu, "CPU $1% ", 2)
 end

return widgets
