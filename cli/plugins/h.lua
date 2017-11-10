
local function run (msg, matches)
---------------------------------------
local sudo = 353171541 --sudo id for send pm
--------------------------------------—
local data = load_data(_config.moderation.data)
local i = 1
 if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
message = "_No_ *owner*"
end
 message = '<b>لیست اونر ها</b>:\n'
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
---------------------------------------
local data = load_data(_config.moderation.data)
local i = 1
 if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
   return "در حال حاضر هیچ مدیری برای گروه انتخاب نشده است"
 end
   message2 = '*لیست مدیران گروه :*\n'
  for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
    message2 = message2 ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
--------------------------------------

local data = load_data(_config.moderation.data)
local linkgp = data[tostring(msg.to.id)]['settings']['linkgp']
if not linkgp then
linkgp ="Gp Not Link"
end
-----------------------------------------
if (matches[1] == "helpmesudo" and is_mod(msg) and not Clang) or (matches[1] == "کمک سودو"  and is_mod(msg) and Clang) then
local text = "درخواست کننده کمک :@"..msg.from.username.."\n"..msg.from.id.."\n"..msg.from.first_name.."\nلینک گروه"..linkgp.."\nنام گروه"..msg.to.title.."\nایدی گروه\n"..msg.to.id.."\n"..message.."\n"..message2.."\n اونر این گروه از شما درخواست کمک کرده لطفا وارد گروه شده کمک کنید!"
tdcli.sendMessage(sudo, 0, 1, text, 1,'html')
return " درخواست کمک شما به سودو ارسال شد."
end
end

return {
patterns = {
"helpmesudo",
"کمک سودو"
},
run = run
}
