-- with locatorjs
-- hammerspoon://openFile?path=${filePath}&line=${line}&column=${column}

-- 设置 Neovim 可执行文件的路径
local nvimPath = "/opt/homebrew/bin/nvim"

hs.urlevent.bind("openFile", function(eventName, params)
  hs.printf("openFile event received")

  local filePath = params["path"]
  local line = tonumber(params["line"])
  local column = tonumber(params["column"])

  hs.printf("File path: %s", filePath)
  hs.printf("Line: %d", line)
  hs.printf("Column: %d", column)

  if filePath ~= nil and line ~= nil and column ~= nil then
    hs.printf("Neovim path: %s", nvimPath)

    -- 使用 Lua 的内置函数获取目录路径
    local dirPath = string.match(filePath, "(.*[/\\])")

    if not dirPath then
      hs.printf("Failed to get directory path")
      return
    end

    hs.printf("Directory path: %s", dirPath)

    local command = string.format("cd %q && %s %q +'execute \"normal! %dG%d|\"'",
      dirPath, nvimPath, filePath, line, column)

    hs.printf("Executing command: %s", command)

    local scriptFile = os.tmpname()
    hs.printf("Temporary script file: %s", scriptFile)

    local file = io.open(scriptFile, "w")
    if file then
      file:write(command)
      file:close()
      hs.printf("Command written to script file")
    else
      hs.printf("Failed to create script file")
    end

    local appleScript = [[
      tell application "iTerm2"
          activate
          tell current window to create tab with default profile
          tell current session of current window to write text "bash ]] .. scriptFile .. [["
      end tell
    ]]

    hs.printf("Executing AppleScript: %s", appleScript)

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
