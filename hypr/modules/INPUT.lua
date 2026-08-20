hl.config({
    input = {
        kb_layout  = "us, ara",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",
        numlock_by_default = true,
        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false, ---------false mean when you gusture up it goes up not the oppisite
            tap_to_click = true,
			natural_scroll = false,
        },
    },
})


hl.gesture({
    fingers = 3,
    direction = "Horizontal",
    action = "workspace"
})


hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.35
})

