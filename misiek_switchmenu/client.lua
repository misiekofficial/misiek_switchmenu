--[[
	Created by ✪ Misiek™#9040
	discord: https://discord.gg/HtPSCZrxnC
]]

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

RegisterNUICallback("executeCommand", function(data, cb)
	if(data.param and #data.param > 0) then
		TriggerEvent(("misiek_switchmenu:%s"):format(data.event), ("%s"):format(data.param))
	else
		TriggerEvent(("misiek_switchmenu:%s"):format(data.event))
	end

    cb("ok")
end)

function SetCursor(toggle)
    SetCursorLocation(0.5, 0.5)
    SetNuiFocus(toggle, toggle)
	SendNUIMessage({
		show = toggle
    })
end

CreateThread(function()
    repeat
        if IsControlJustReleased(0, 288) then
            DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 69, true)
			DisableControlAction(0, 92, true)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 122, true)
			DisableControlAction(0, 135, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 144, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 329, true)
			DisableControlAction(0, 346, true)
            
            SetCursor(true)
        end

        Citizen.Wait(0)
    until false
end)

RegisterNUICallback("close", function(_, cb)
	SetNuiFocus(false, false)

	SendNUIMessage({
		show = false
	})

    cb("ok")
end)