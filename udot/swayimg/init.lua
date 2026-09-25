-- general

-- disable floating window
swayimg.overlay = false

swayimg.text.timeout = 0
swayimg.text.color = 0xffeeeeee
swayimg.text.background = 0x88000000

swayimg.viewer.text = {
   topleft = {"{name}"},
   topright = {"{frame.width}x{frame.height}"},
   bottomright = {"{list.index}/{list.total}"}
}

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

swayimg.viewer.on_key("j", function()
   local step = 0.2
   if swayimg.viewer.scale < 2.0 then
      swayimg.viewer.scale = swayimg.viewer.scale + step
   end
end)

swayimg.viewer.on_key("k", function()
   local step = 0.2
   if swayimg.viewer.scale > 0.3 then
      swayimg.viewer.scale = swayimg.viewer.scale - step
   end
end)
