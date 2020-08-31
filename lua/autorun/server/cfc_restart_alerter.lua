require( "webhooker_interface" )
local Webhooker = WebhookerInterface()

local function printLog( log )
    print( "[CFC Restart Alerter] " .. log )
end

local function onSuccess( result )
    printLog( "Request succeeded! : " .. result )
end

local function onFailure( failure )
    printLog( "Request failed! : " .. failure )
end

local function alertOfRestart()
    Webhooker:send( "gamemode-loaded", {}, onSuccess, onFailure )

    printLog( "Removing RestartAlerter Tick hook" )
    hook.Remove( "Tick","CFC_RestartAlerter" )
end

hook.Add( "Tick", "CFC_RestartAlerter", alertOfRestart )

printLog( "The restart script has been enabled!" )
