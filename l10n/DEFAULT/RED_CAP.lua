---
-- Name: AID-A2A-040 - CAP Independent Detection in EWR
-- Author: XIFU_golfo
-- MISSION: PVP_CAMPAÑA
-- Date Created: 1 NOV 2019


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( "FLOTRED" )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 20000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetEngageRadius( 50000 )
-- Setup the squadrons.

A2ADispatcher:SetSquadron( "5js", AIRBASE.Caucasus.Mineralnye_Vody, { "SU27CAP" }, 4 )
REDcapzonesur = ZONE_POLYGON:New( "CAPZONE", GROUP:FindByName( "CAPZONE" ) )
A2ADispatcher:SetSquadronCap( "5js", REDcapzonesur, 8000, 8000, 600, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "5js", 1, 280, 280 )
A2ADispatcher:SetSquadronGrouping("5js",2 )

A2ADispatcher:SetSquadron( "6js", AIRBASE.Caucasus.Mineralnye_Vody, { "SU27CAP2" }, 4 )
REDcapzonesur2 = ZONE_POLYGON:New( "CAPZONE2", GROUP:FindByName( "CAPZONE2" ) )
A2ADispatcher:SetSquadronCap( "6js", REDcapzonesur2, 8000, 9000, 600, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "6js", 1, 280, 300 )
A2ADispatcher:SetSquadronGrouping("6js",2 )


--A2ADispatcher:SetSquadronCapRacetrack("5js",10,20,150,150,DurationMin,DurationMax,CapCoordinates)


A2ADispatcher:SetDefaultTakeoffFromParkingCold()
--A2ADispatcher:SetDefaultLandingNearAirbase()
