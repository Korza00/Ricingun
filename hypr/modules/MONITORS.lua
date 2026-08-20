hl.monitor({
    output   = "", --you can add "mirror" in here it will be mirrir = "the name of the output eDP-2 e.g"
    mode     = "1920x1080=", --can use ("preferred"-> size and refresh "highres"->resolution "highrr"->refresh rate "maxwidth")
    position = "auto",
    scale    = 1,
})
  
hl.monitor({ output = "", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1366x768@60.003", position = "0x0", scale = 1, vrr = 0, bitdepth = 10 })
