ChaosModifierTase = ChaosModifier.class("ChaosModifierTase")
ChaosModifierTase.run_as_client = true

function ChaosModifierTase:start()
	local player = managers.player:local_player()
	for _, character in pairs(managers.criminals:characters()) do
		if alive(character.unit) and (character.unit == player or character.data.ai and Network:is_server()) and character.unit:character_damage():can_be_tased() then
			character.unit:character_damage():on_non_lethal_electrocution(0.3)
		end
	end
end

return ChaosModifierTase
