-- ATIS Nellis AFB on 270.100 MHz AM.

atisNellis=ATIS:New(AIRBASE.Caucasus.Tbilisi_Lochini, 132.800)
atisNellis:SetRadioRelayUnitName("Radio Relay Nellis")
atisNellis:SetActiveRunway("13R")
atisNellis:SetTowerFrequencies({267.000, 138.000})
atisNellis:SetTACAN(25)
atisNellis:AddILS(110.3)
atisNellis:Start()


local airbases=AIRBASE.GetAllAirbases()
for _,_airbase in pairs(airbases) do
  local airbase=_airbase --Wrapper.Airbase#AIRBASE
  airbase:GetRunwayData(nil, true)
end