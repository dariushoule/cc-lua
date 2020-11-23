-- MD5:dbd26cb8503a83657e6aa461cc263807
s = "What in the Nether did you just say to me you fucking tree-puncher? I'll have you know I'm Steve, and I've been on numerous raids on the End, and I have over 300 Nether Stars. I have playtime in numerous Creative servers, PVE servers, and currently the fucking best-geared on this death-ban server. You're nothing to me but another skeleton pansy-tossing arrows like before the buff, hitting the fucking 2-block ceiling everytime. My arrows from my Power 4 Infinity Bow will smite you down to XP. You think you can just fucking join this server and call me out over global chat? Think again you zombie-brained stone-aged square. As we speak I'm chatting with my PVP group hidden throughout the entire fucking server and you're being scouted out from your dirt pit, so you better prepare for the impending server-rainstorm you block head. The rainstorm that'll crush your already pathetic FPS and your putrid default skin. You're gonna be banned dirt-gobbler. I can be anywhere, anytime, and I can fucking grief you in over seven hundred ways, and that's just with my fist. Not only are my MCMMO stats maxed on this server, but I have access to our entire clan's armory, and I will use it to the fullest extent to purge your laggy ass off the face of the Overworld you fucking pig. If only you could have foreseen what unholy retribution your little \"clever\" chatter would have damned your playtime on here, maybe you would have kept it in fucking private chat. But you spoke in the wrong chat, you derped big-time, and now you're gonna pay the diamond you shy silverfish. I will drown you in ghast-fire and lava. You're fucking bonemeal, chicken little."

local printer = peripheral.wrap("right")
local l = #s

while (l > 0) do
    local row_i = 1
    if printer.newPage() then
        local w, h = printer.getPageSize()
        print("wh", w, h)
        while (row_i <= h and l > 0) do
            local col_i = 1
            while (col_i <= w and l > 0) do
                if printer.getPaperLevel() == 0 then
                    error("There is no paper in the printer!")
                end
                if printer.getInkLevel() == 0 then
                    error("There is no ink in the printer!")
                end

                printer.setCursorPos(row_i, col_i)
                printer.write(string.sub(s, 1, 1))
                s = string.sub(2, #s)
                l = #s
                col_i = col_i + 1
            end
            row_i = row_i + 1
        end
        printer.endPage()
    else
        error("Page could not be created.")
    end
end