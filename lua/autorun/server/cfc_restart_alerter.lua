require( "webhooker_interface" )
require( "logger" )

local Webhooker = WebhookerInterface()
local Logger = Logger( "CFC Restart Alerter" )

local function onSuccess( result )
    Logger:info( "Request succeeded! : ", result )
end

local function onFailure( failure )
    Logger:error( "Request failed! :", failure )
end

local function alertOfRestart()
    hook.Remove( "Tick","CFC_RestartAlerter" )

    Webhooker:send( "gamemode-loaded", {}, onSuccess, onFailure )
    Logger:debug( "Removing RestartAlerter Tick hook" )
end

hook.Add( "Tick", "CFC_RestartAlerter", alertOfRestart )

Logger:info( "The restart script has been enabled!" )
