ChaosModifierJamDrills = ChaosModifier.class("ChaosModifierJamDrills")
ChaosModifierJamDrills.run_as_client = false

function ChaosModifierJamDrills:can_trigger()
	return table.size(TimerGui.active_units) > 0
end

function ChaosModifierJamDrills:start()
	for _, unit in pairs(TimerGui.active_units) do
		if alive(unit) then
			unit:timer_gui():set_jammed(true)
		end
	end
end

return ChaosModifierJamDrills
