hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 6,

        border_size = 2,

        col = {
            active_border   = "#2e2e2a",
            inactive_border = "#2e2e2a",
        },


        resize_on_border = true,


        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 5,

        active_opacity   = 1.0,
        inactive_opacity = 0.95,

        shadow = {
            enabled      = false,
            range        = 10,
            render_power = 10,
            color        = 0xee1a1a1a,
            -- offset = "11",
        },

        blur = {
            enabled   = true,
            size      = 2,
            passes    = 3,
            vibrancy  = 0.95850,
            ignore_opacity = true,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true, 
    
    },
})



hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
        -- smart_resizing = false, -- You probably want this
        -- permanent_direction_override = false 

    },
})


hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })


----------------------
