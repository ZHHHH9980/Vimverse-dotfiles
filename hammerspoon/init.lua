-- Handler for "openFile" event
hs.urlevent.bind("openFile", function(eventName, params)
  hs.printf("Received openFile event")

  local filePath = params["path"]
  local line = tonumber(params["line"])
  local column = tonumber(params["column"])

  hs.printf("File path: %s", filePath)
  hs.printf("Line: %d", line)
  hs.printf("Column: %d", column)

  if filePath and line and column then
    -- Extract directory path from the file path
    local dirPath = string.match(filePath, "(.*[/\\])")
    if not dirPath then
      hs.alert.show("Failed to get directory path")
      return
    end
    hs.printf("Directory path: %s", dirPath)

    -- Construct the Neovim command
    local command = string.format("cd %s && nvim %s +'normal! %dG%d|'", dirPath, filePath, line, column)
    hs.printf("Neovim command: %s", command)

    -- Execute the command in iTerm2 using AppleScript
    local script = string.format([[
      tell application "iTerm2"
        activate
        tell current window to create tab with default profile
        tell current session of current window
          write text "%s"
        end tell
      end tell
    ]], command)

    -- Print the generated AppleScript
    hs.printf("Generated AppleScript:")
    hs.printf("%s", script)

    local success, output = hs.applescript.applescript(script)
    if success then
      hs.alert.show("Command sent to iTerm2")
    else
      hs.alert.show("Failed to send command to iTerm2")
      hs.printf("Error: %s", output)
    end
  else
    hs.alert.show("Invalid parameters for opening file.")
  end
end)

-- Debugging: Print a message to confirm that the script has loaded
hs.alert.show("Hammerspoon script loaded")
