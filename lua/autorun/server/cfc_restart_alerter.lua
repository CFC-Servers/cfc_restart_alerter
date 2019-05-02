local endpoint

local function getEndpoint()
    return file.Read("restart_alerter_endpoint.txt", "DATA")
end

local function alertOfRestart()
    http.Post( endpoint, {}, function( result ) end, function( failed ) end )
end

endpoint = getEndpoint()
if endpoint == nil then
    print("[CFC Restart Alerter] The restart endpoint hasn't been set! Addon cannot function.")
else
    hook.Remove("OnGamemodeLoaded","CFC_RestartAlerter")
    hook.Add("OnGamemodeLoaded", "CFC_RestartAlerter", alertOfRestart)
end
