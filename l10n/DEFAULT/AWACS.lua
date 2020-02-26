-- AWACS --
awacs1 = SPAWN:New("MAGIC")
function awacs1spawn()
  awacs1:OnSpawnGroup(
    function (awacs1_group)
      awacs1_unit_fuel_scheduler = SCHEDULER:New(nil,function ()
        awacs1_unit = awacs1_group:GetUnit(1)
        if awacs1_unit
        then
          awacs1_unit_fuel = awacs1_unit:GetFuel()
          if awacs1_unit_fuel <= 0.3
          then
            awacs1_group:ClearTasks()
            awacs1_unit_fuel_scheduler:Stop()
            env.info(awacs1_group:GetName().." is low on fuel and RTBing")
            awacs1spawn()
          end
        else
          awacs1_unit_fuel_scheduler:Stop()
          awacs1spawn()
        end
      end
      ,{},5,300)
    end):Spawn()
end
awacs1spawn()
