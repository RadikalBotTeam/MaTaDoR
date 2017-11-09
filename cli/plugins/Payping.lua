local function run(msg, matches)
if matches[1]:lower() == "setnamepayping" and is_sudo(msg)then
redis:set("setnamepayping",matches[2])
return "*نام درگاه پی پینگ ثبت شد :*\n"..matches[2]
end
if matches[1]:lower() == "setpaypinglink" and is_sudo(msg) then
redis:set("setpaypinglink",matches[2])
return "*لینک درگاه پی پینگ ثبت شد :*\n"..matches[2]
end
if matches[1]:lower() == "payping" and is_sudo(msg) then
local paypingname = redis:get("setnamepayping")
local paypinglink = redis:get("setpaypinglink")
if tonumber(matches[2]) < 1000 then
return "`مبلغ وارد شده باید بیشتر از هزار تومن باشد.`"
end
if not paypingname then
return "*لطفا ابتدا نام اکانت پی پینگ خود را تنظیم کنید.*\n`مثال :`\n/setnamepayping mahdi mohseni"
end
if not paypinglink then
return "*لطفا ابتدا لینک اکانت پی پینگ خود را تنظیم کنید.*\n`مثال :`\n/setpaypinglink mahdiroo"
end
texth = "پرداخت مبلغ "..matches[2].." تومان به "..paypingname..""
local function payping(TM, MR)
      if MR.results_ and MR.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, MR.inline_query_id_, MR.results_[0].id_, dl_cb, nil)
    else
       text = "لطفا ابتدا با اکانت ربات @bold را استارت کنید"
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "html")
   end
end
tdcli.getInlineQueryResults(107705060, msg.to.id, 0, 0, "[ "..texth.."](https://www.payping.ir/"..paypinglink.."/"..matches[2]..")", 0, payping, nil)
end
end

return {
patterns ={
"^[#!/]([Pp]ayping) (%d+)$",
"^([Pp]ayping) (%d+)$",
"^[#!/]([Ss]etnamepayping) (.*)$",
"^([Ss]etnamepayping) (.*)$",
"^[#!/]([Ss]etpaypinglink) (.*)$",
"^([Ss]etpaypinglink) (.*)$",
},
run=run,
}
