load("BetterBindings") -- Load the mod
setExtensionUnloadMode("BetterBindings", "manual") -- Set the unload mode to manual (This is very new, old function is deprecated)
extensions.core_input_categories.BetterBindings = { order = 99999, icon = "settings", title = "BetterBindings", desc = "'Quality of Life' keybinds to make your rig feel just a little more real." } -- Inject BetterBindings input category at bottom of input categories list
