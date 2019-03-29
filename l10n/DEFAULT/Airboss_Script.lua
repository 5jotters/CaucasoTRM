--------------------
-- AIRBOSS Script --
--------------------

-- Switches if you want to include a rescue helo and/or a recovery tanker.
local Tanker=true
local Awacs=true
local Helo=true
local Traffic=false -- No IA traffic

-- Set mission menu.
AIRBOSS.MenuF10Root=MENU_MISSION:New("Airboss").MenuPath

-- No MOOSE settings menu.
_SETTINGS:SetPlayerMenuOff()

-- S-3B Recovery Tanker spawning in air.
local stennis_tanker=nil  --Ops.RecoveryTanker#RECOVERYTANKER
if Tanker then
  stennis_tanker=RECOVERYTANKER:New("USS Stennis", "Texaco Group")
  stennis_tanker:SetTakeoffAir()
  stennis_tanker:SetAltitude(6000) -- Valor por defecto 6000
  stennis_tanker:SetRadio(149)
  stennis_tanker:SetModex(511)
  stennis_tanker:SetTACAN(40, "S-3")
  stennis_tanker:SetSpeed(350)  
--  stennis_tanker:SetHomeBase(AIRBASE.Caucasus.Kobuleti)  -- Si queremos que NO tome en CVN Stennis
  stennis_tanker:Start()
end

-- E-2D AWACS spawning in air
local stennis_awacs=nil  --Ops.RecoveryTanker#RECOVERYTANKER
if Awacs then
  stennis_awacs=RECOVERYTANKER:New("USS Stennis", "E-2D Wizard Group")
  stennis_awacs:SetAWACS()
  stennis_awacs:SetTakeoffAir()
  stennis_awacs:SetRadio(237)
  stennis_awacs:SetAltitude(20000)
  stennis_awacs:SetCallsign(CALLSIGN.AWACS.Wizard)
  stennis_awacs:SetRacetrackDistances(30, 15)
  stennis_awacs:SetModex(611)
  stennis_awacs:SetTACAN(50, "WIZ")
  stennis_awacs:__Start(1)
end

-- Rescue Helo spawned in air with home base USS Perry.
if Helo then
  -- Has to be a global object!
  rescuehelo=RESCUEHELO:New("USS Stennis", "Rescue Helo")
  rescuehelo:SetHomeBase(AIRBASE:FindByName("Perry"))
  -- rescuehelo:SetTakeoffAir()
  rescuehelo:SetTakeoffHot() -- Esta es la opción por defecto en realidad
  rescuelo:SetRespawnInAir() -- Los siguients respawn en el aire
  rescuehelo:SetModex(42)
  rescuehelo:Start()
end
  
-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("USS Stennis")

-- Add recovery windows:
-- Case I from 9 to 11 am.
local window1=AirbossStennis:AddRecoveryWindow( "9:00", "11:00", 1, nil, true, 25)
-- Case II with +15 degrees holding offset from 15:00 for 120 min.
local window2=AirbossStennis:AddRecoveryWindow("15:00", "17:00", 2,  15, true, 23)
-- Case III with +30 degrees holding offset from 2100 to 2300.
local window3=AirbossStennis:AddRecoveryWindow("21:00", "23:00", 3,  30, true, 21)

-- Radio relay units.
AirbossStennis:SetRadioRelayLSO(rescuehelo:GetUnitName())
AirbossStennis:SetRadioRelayMarshal("Huey Radio Sender")

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Single carrier menu optimization.
AirbossStennis:SetMenuSingleCarrier()
 
-- AI groups explicitly excluded from handling by the Airboss
local CarrierExcludeSet=SET_GROUP:New():FilterPrefixes("E-2D Wizard Group"):FilterStart()
AirbossStennis:SetExcludeAI(CarrierExcludeSet)

-- Let AI refuel when they are low on gas.
--AirbossStennis:SetRefuelAI(20)
 
-- Remove landed AI planes from flight deck.
AirbossStennis:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossStennis:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossStennis:SetAutoSave()

-- Enable trap sheet.
AirbossStennis:SetTrapSheet()

  -- Set recovery tanker.
if Tanker then
  AirbossStennis:SetRecoveryTanker(stennis_tanker)
end

-- Start airboss class.
AirbossStennis:Start()

---------------------------------
--- Define LSO/Marshal Shifts ---
---------------------------------

-- Current shift.
local shift=1

local function ChangeShift(airboss)
  local airboss=airboss --Ops.Airboss#AIRBOSS

  -- Next shift.
  shift=shift+1

  -- One cycle done. Next will be first shift.
  if shift==5 then
    shift=1
  end

  -- Set sound folder and voice over timings. 
  if shift==1 then
    env.info("Starting LSO/Marshal Shift 1: LSO Raynor, Marshal Raynor")
    airboss:SetVoiceOversLSOByRaynor()
    airboss:SetVoiceOversMarshalByRaynor()
  elseif shift==2 then
    env.info("Starting LSO/Marshal Shift 2: LSO FF, Marshal Raynor")
    airboss:SetVoiceOversLSOByFF("Airboss Soundpack LSO FF/")
    airboss:SetVoiceOversMarshalByRaynor()  
  elseif shift==3 then
    env.info("Starting LSO/Marshal Shift 3: LSO Raynor, Marshal FF")
    airboss:SetVoiceOversLSOByRaynor()
    airboss:SetVoiceOversMarshalByFF("Airboss Soundpack Marshal FF/")
  elseif shift==4 then
    env.info("Starting LSO/Marshal Shift 4: LSO FF, Marshal FF")
    airboss:SetVoiceOversLSOByFF("Airboss Soundpack LSO FF/")
    airboss:SetVoiceOversMarshalByFF("Airboss Soundpack Marshal FF/")
  end
 
end

-- Length of shift in minutes.
local L=30

-- Start shift scheduler to change shift every L minutes.
SCHEDULER:New(nil, ChangeShift, {AirbossStennis}, L*60, L*60)


--- Function called when recovery starts.
function AirbossStennis:OnAfterRecoveryStart(Event, From, To, Case, Offset)
  env.info(string.format("Starting Recovery Case %d ops.", Case))
end


-- Spawn some AI flights as additional traffic.
if Traffic then
  local F181=SPAWN:New("FA18 Group 1"):InitModex(101) -- Coming in from NW after  ~6 min
  local F182=SPAWN:New("FA18 Group 2"):InitModex(201) -- Coming in from NW after ~20 min
  local F183=SPAWN:New("FA18 Group 3"):InitModex(301) -- Coming in from W  after ~18 min
  local F14=SPAWN:New("F-14B 2ship"):InitModex(401)   -- Coming in from SW after  ~4 min
  local E2D=SPAWN:New("E-2D Group"):InitModex(501)    -- Coming in from NE after ~10 min
  local S3B=SPAWN:New("S-3B Group"):InitModex(601)    -- Coming in from S  after ~16 min
  
  -- Spawn always 9 min before the recovery window opens.
  local spawntimes={"8:51", "14:51", "20:51"}
  for _,spawntime in pairs(spawntimes) do
    local _time=UTILS.ClockToSeconds(spawntime)-timer.getAbsTime()
    if _time>0 then
      SCHEDULER:New(nil, F181.Spawn, {F181}, _time)
      SCHEDULER:New(nil, F182.Spawn, {F182}, _time)
      SCHEDULER:New(nil, F183.Spawn, {F183}, _time)
      SCHEDULER:New(nil, F14.Spawn,  {F14},  _time)
      SCHEDULER:New(nil, E2D.Spawn,  {E2D},  _time)
      SCHEDULER:New(nil, S3B.Spawn,  {S3B},  _time)
    end
  end  
end

