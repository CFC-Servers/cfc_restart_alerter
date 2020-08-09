require( "webhooker_interface" )
local Webhooker = WebhookerInterface()
local endpoint

local function printLog( log )
    print( "[CFC Restart Alerter] " .. log )
end

local function getEndpoint()
    local contents = file.Read( "cfc/restart_alerter_endpoint.txt", "DATA" )
    local endpoint = string.gsub( contents, "%s", "" )

    return endpoint
end

local function onSuccess( result )
    printLog( "Request succeeded! : " .. result )
end

local function onFailure( failure )
    printLog( "Request failed! : " .. failure )
end

local function alertOfRestart()
    Webhooker:send( endpoint, {}, onSuccess, onFailure )

    printLog( "Removing RestartAlerter Tick hook" )
    hook.Remove( "Tick","CFC_RestartAlerter" )
end

endpoint = getEndpoint()
printLog( "Read endpoint as: " .. endpoint )
if endpoint == nil then
    printLog( "The restart endpoint hasn't been set! Addon cannot function." )
else
    hook.Remove( "Tick","CFC_RestartAlerter" )
    hook.Add( "Tick", "CFC_RestartAlerter", alertOfRestart )

    printLog( "The restart script has been enabled!" )
end
