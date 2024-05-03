function resetAButton(m)
	if m.action == ACT_JUMP or m.action == ACT_JUMP_KICK then
		if m.prevAction == ACT_JUMP or m.prevAction == ACT_JUMP_KICK then
			m.action = ACT_IDLE
		else
			m.action = m.prevAction
		end
	end
end
hook_event(HOOK_BEFORE_MARIO_UPDATE, resetAButton)