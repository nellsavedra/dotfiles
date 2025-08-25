require("hs.ipc")
hs.window.animationDuration = 0

function centerWindow()
  local win = hs.window.focusedWindow()
  if win then
      print("Window found: " .. win:title())
      win:centerOnScreen()
  else
      print("No focused window found!")
  end
end

function toggleMute()
  local mic = hs.audiodevice.defaultInputDevice()
  local state = not mic:inputMuted()
  hs.fnutils.each(hs.audiodevice.allInputDevices(), function(device)
    device:setInputMuted(state)
  end)
  
  hs.alert.defaultStyle.fillColor = {red=0, green=0, blue=0, alpha=1}
  hs.alert.defaultStyle.strokeColor = {white=0, alpha=1}
  hs.alert.defaultStyle.textColor = {white=1, alpha=1}
  hs.alert.defaultStyle.textSize = 50
  hs.alert.defaultStyle.radius = 10

  if state then
    hs.alert.closeAll()
  
    hs.alert.show("Muted", math.huge)
  else
    hs.alert.closeAll()
    hs.alert.show('Unmuted', 2)
  end
end
