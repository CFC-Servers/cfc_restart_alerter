local endpoint

local function printLog(log)
    print("[CFC Restart Alerter] " .. log)
end

local function getEndpoint()
    local contents = file.Read("cfc/restart_alerter_endpoint.txt", "DATA")
    return string.gsub("[\r\n]", "", contents)[1]
end

local function alertOfRestart()
    printLog("Issueing a restart request to '" .. endpoint .. "'")
    http.Post( endpoint, {}, function( result ) end, function( failed ) print("[CFC Restart Alerter] Request failed! : " .. failed) end )
end

endpoint = getEndpoint()
printLog("Read endpoint as: " .. endpoint)
if endpoint == nil then
    printLog("The restart endpoint hasn't been set! Addon cannot function.")
else
    hook.Remove("OnGamemodeLoaded","CFC_RestartAlerter")
    hook.Add("OnGamemodeLoaded", "CFC_RestartAlerter", alertOfRestart)
    printLog("The restart script has been enabled!")
end
