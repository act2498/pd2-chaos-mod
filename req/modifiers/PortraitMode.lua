---@class ChaosModifierPortraitMode : ChaosModifier
ChaosModifierPortraitMode = class(ChaosModifier)
ChaosModifierPortraitMode.class_name = "ChaosModifierPortraitMode"
ChaosModifierPortraitMode.duration = 45
ChaosModifierPortraitMode.run_as_client = true

function ChaosModifierPortraitMode:start()
	local panel = managers.hud:panel(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	local w = 0.5 * (panel:w() - panel:h() * panel:h() / panel:w())

	self._left = panel:rect({
		layer = -10,
		color = Color.black,
		w = w
	})

	self._right = panel:rect({
		layer = -10,
		color = Color.black,
		w = w
	})

	self._right:set_right(panel:w())
end

function ChaosModifierPortraitMode:stop()
	if alive(self._left) then
		self._left:parent():remove(self._left)
	end
	if alive(self._right) then
		self._right:parent():remove(self._right)
	end
end

return ChaosModifierPortraitMode
