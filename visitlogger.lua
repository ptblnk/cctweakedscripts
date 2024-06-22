scanner = peripheral.find("universal_scanner")
location = vector.new(0, 0, 0) -- enter computer location here
logfile = fs.open("logs.txt", "a")
 
while true do
local log = ""
local data = scanner.scan("player", 6)
if data ~= nil then
 for i = 1, #data do
  if data[i] ~= nil then
   local coords = location:add(vector.new(data[i]["x"], data[i]["y"], data[i]["z"]+1)) -- +1 to z because the scanner coordinate for Z is inaccurate.
   log = log .. data[i]["displayName"] .. ": " .. tostring(coords) .. "\n"
  end
 end
 if log ~= "" then
  logfile.writeLine(os.date("%d.%m.%y %H:%M:%S"))
  logfile.writeLine(log)
  logfile.flush()
 end
end
sleep(1)
end
logfile.close()