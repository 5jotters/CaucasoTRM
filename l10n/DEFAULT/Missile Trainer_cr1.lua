
-- Only use Include.File when developing new MOOSE classes.
-- When using Moose.lua in the DO SCIPTS FILE initialization box, 
-- these Include.File statements are not needed, because all classes within Moose will be loaded.


-- This is an example of a global
local Trainer = MISSILETRAINER
  :New( 50, "MISSILE TRAINER" )
  :InitMessagesOnOff(true)
  :InitAlertsToAll(true) 
  :InitAlertsHitsOnOff(true)
  :InitAlertsLaunchesOnOff(false) -- I'll put it on below ...
  :InitBearingOnOff(false)
  :InitRangeOnOff(false)
  :InitTrackingOnOff(false)
  :InitTrackingToAll(false)
  :InitMenusOnOff(true)

Trainer:InitAlertsToAll(true) -- Now alerts are also on
