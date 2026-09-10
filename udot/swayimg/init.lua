-- general

-- disable floating window
swayimg.overlay = false

swayimg.text.timeout = 0
swayimg.text.color = 0xffeeeeee
swayimg.text.background = 0x88000000

swayimg.viewer.set_text("topleft", {"{name}"})
swayimg.viewer.set_text("topright", {"{frame.width}x{frame.height}"})
swayimg.viewer.set_text("bottomright", {"{list.index}/{list.total}"})

-- keybindings

swayimg.viewer.on_key("q", function()
   swayimg.exit()
end)

swayimg.viewer.on_key("i", function()
   swayimg.text.visible = not swayimg.text.visible
end)

swayimg.viewer.on_key("h", function()
   swayimg.viewer.open("prev")
end)

swayimg.viewer.on_key("l", function()
   swayimg.viewer.open("next")
end)
