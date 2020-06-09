---
-- Name: AID-A2A-017 - Spawn Altitude Test
-- Author: FlightControl
-- Date Created: 05 Aug 2017



do

  -- Declare SPAWN objects
  Spawn_RED1 = SPAWN:New("RED1"):InitLimit( 1, 8 ):SpawnScheduled( 60, 0 )
  Spawn_RED2 = SPAWN:New("RED2"):InitLimit( 1, 8 ):SpawnScheduled( 60, 0 )
  Spawn_RED3 = SPAWN:New("RED3"):InitLimit( 1, 8 ):SpawnScheduled( 60, 0 )
  --Spawn_arcoBLUE = SPAWN:New("ARCO"):InitLimit( 1, 8 ):SpawnScheduled( 60, 0 ):InitRepeatOnEngineShutDown():InitRepeatOnLanding()
  --Spawn_AWACS = SPAWN:New("AWACS"):InitLimit( 1, 4 ):SpawnScheduled( 100, 0 ):InitRepeatOnEngineShutDown():InitRepeatOnLanding()


 end








