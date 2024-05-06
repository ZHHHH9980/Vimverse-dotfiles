-- with locatorjs
-- hammerspoon://openFile?path=${filePath}&line=${line}&column=${column}

hs.urlevent.bind("openFile", function(eventName, params)
  hs.printf("Received event: " .. eventName)
  hs.printf("Params: " .. hs.inspect(params))

  local filePath = params["path"]
  local line = tonumber(params["line"])
  local column = tonumber(params["column"])

  hs.printf("File path: " .. (filePath or "nil"))
  hs.printf("Line: " .. (line or "nil"))
  hs.printf("Column: " .. (column or "nil"))

  if filePath ~= nil and line ~= nil and column ~= nil then
    local nvimBin = "/opt/homebrew/bin/nvim"
    local command = string.format("%s %s +'execute \"normal! %dG%d|\"'", nvimBin, filePath, line, column)
    hs.printf("Executing command: " .. command)

    local scriptFile = os.tmpname()
    local file = io.open(scriptFile, "w")
    file:write(command)
    file:close()

    local appleScript = [[
      tell application "iTerm2"
          activate
          tell current window to create tab with default profile
          tell current session of current window to write text "bash ]] .. scriptFile .. [["
      end tell
    ]]
    local success, result, output = hs.osascript.applescript(appleScript)
    if success then
      hs.printf("Command executed successfully.")
    else
      hs.printf("Failed to execute command.")
      hs.printf("Error: " .. hs.inspect(output))
    end

    hs.timer.doAfter(1, function() os.remove(scriptFile) end)
  else
    hs.printf("Invalid parameters, not executing command")
  end
end)

