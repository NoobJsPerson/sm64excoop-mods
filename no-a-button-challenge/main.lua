-- name: No A Button Challenge
-- description: Disables the A Button

------		Globals		------
welcomeprompt = 1

------		locals		------
local texwelcome = get_texture_info('welcome')

--functions
function welcome(m)
	print(m)
    if (welcomeprompt) == 1 then
        if (gMarioStates[0].controller.buttonPressed & B_BUTTON) ~= 0 then
            welcomeprompt = 0
        end
    end
    if (welcomeprompt) == 1 then
        djui_hud_set_resolution(RESOLUTION_DJUI);
        djui_hud_render_texture(texwelcome, 425, 30, 1, 1)
    end
end

function disableAButton(m)
	m.controller.buttonDown = m.controller.buttonDown & ~A_BUTTON
    m.controller.buttonPressed = m.controller.buttonPressed & ~A_BUTTON
end

function displayInfo(m)
	djui_chat_message_create('No A Button Challenge:')
	djui_chat_message_create('Your A Button is disabled')
	djui_chat_message_create('The goal is to collect as many stars and hopefully beat the game')
	djui_chat_message_create('Use team work to overcome this limitation, Good luck!')
	return true
end


hook_event(HOOK_ON_HUD_RENDER, welcome)
hook_event(HOOK_BEFORE_MARIO_UPDATE, disableAButton)
hook_chat_command('a', "Show Info about the No A Button Challenge", displayInfo)
