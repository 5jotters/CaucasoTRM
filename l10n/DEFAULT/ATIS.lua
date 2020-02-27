-- ATIS Tbilisi en 132.800 MHz AM.
atisTbilisi=ATIS:New(AIRBASE.Caucasus.Tbilisi_Lochini, 132.800)
atisTbilisi:SetRadioRelayUnitName("Radio Relay Tbilisi")
atisTbilisi:SetActiveRunway("13R")
atisTbilisi:SetTowerFrequencies({267.000, 138.000})
atisTbilisi:SetTACAN(25)
atisTbilisi:AddILS(110.3)
atisTbilisi:Start()

-- ATIS Kutaisi Airport en 134.800 MHz AM.
atisKutaisi=ATIS:New(AIRBASE.Caucasus.Kutaisi, 134.800)
atisKutaisi:SetRadioRelayUnitName("Radio Relay Batumi")
atisKutaisi:SetTowerFrequencies({263.000, 134.000})
atisKutaisi:SetActiveRunway("26")
atisKutaisi:SetTACAN(44)
atisKutaisi:AddILS(109.75)
atisKutaisi:Start()

