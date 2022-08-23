if not pcall(require, "impatient") then
	print("Failed to load impatient.")
end

require("user.settings")
require("user.commands")
require("user.keybinds")
require("user.plugins")
