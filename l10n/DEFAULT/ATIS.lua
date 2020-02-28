-- ATIS Tbilisi en 132.800 MHz AM.
atisTbilisi=ATIS:New(AIRBASE.Caucasus.Tbilisi_Lochini, 132.800)
atisTbilisi:SetRadioRelayUnitName("Radio Relay Tbilisi")
atisTbilisi:SetActiveRunway("13R")
atisTbilisi:SetTowerFrequencies({267.000, 138.000})
atisTbilisi:SetTACAN(25)
atisTbilisi:AddILS(110.3)
atisTbilisi:Start()

-- ATIS Vaziani en 122.700 MHz AM.
atisVaziani=ATIS:New(AIRBASE.Caucasus.Vaziani, 122.700)
atisVaziani:SetRadioRelayUnitName("Radio Relay Vaziani")
atisVaziani:SetActiveRunway("13")
atisVaziani:SetTowerFrequencies({269.000, 140.000})
atisVaziani:SetTACAN(22)
atisVaziani:AddILS(108.75)
atisVaziani:Start()

-- ATIS Kutaisi Airport en 122.100 MHz AM.
atisKutaisi=ATIS:New(AIRBASE.Caucasus.Kutaisi, 122.100)
atisKutaisi:SetRadioRelayUnitName("Radio Relay Kutaisi")
atisKutaisi:SetTowerFrequencies({263.000, 134.000})
atisKutaisi:SetActiveRunway("26")
atisKutaisi:SetTACAN(44)
atisKutaisi:AddILS(109.75)
atisKutaisi:Start()

-- ATIS Kobuleti Airport en 122.300 MHz AM.
atisKobuleti=ATIS:New(AIRBASE.Caucasus.Kobuleti, 122.300)
atisKobuleti:SetRadioRelayUnitName("Radio Relay Kobuleti")
atisKobuleti:SetTowerFrequencies({262.000, 133.000})
atisKobuleti:SetActiveRunway("07")
atisKobuleti:SetTACAN(67)
atisKobuleti:AddILS(111.50)
atisKobuleti:Start()

-- ATIS Batumi Airport on 122.550 MHz AM.
atisBatumi=ATIS:New(AIRBASE.Caucasus.Batumi, 122.550)
atisBatumi:SetRadioRelayUnitName("Radio Relay Batumi")
atisBatumi:SetTowerFrequencies({260, 131})
atisBatumi:SetActiveRunway("31")
atisBatumi:SetTACAN(16)
atisBatumi:AddILS(110.30)
atisBatumi:Start()  

-- ATIS Senaki_Kolkhi Airport on 122.525 MHz AM.
atisSenaki_Kolkhi=ATIS:New(AIRBASE.Caucasus.Senaki_Kolkhi, 122.525)
atisSenaki_Kolkhi:SetRadioRelayUnitName("Radio Relay Senaki")
atisSenaki_Kolkhi:SetTowerFrequencies({261, 132})
atisSenaki_Kolkhi:SetActiveRunway("09")
atisSenaki_Kolkhi:SetTACAN(31)
atisSenaki_Kolkhi:AddILS(108.90)
atisSenaki_Kolkhi:Start()  
