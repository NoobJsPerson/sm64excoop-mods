-- name: No A Button Challenge
-- description: Disables the A Button

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
hook_event(HOOK_BEFORE_MARIO_UPDATE, disableAButton)
hook_chat_command('a', "Show Info about the No A Button Challenge", displayInfo)
