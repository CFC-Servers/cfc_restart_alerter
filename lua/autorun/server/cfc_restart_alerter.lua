local endpoint

local function printLog(log)
    print("[CFC Restart Alerter] " .. log)
end

local function getEndpoint()
    local contents = file.Read("cfc/restart_alerter_endpoint.txt", "DATA")
    local endpoint = string.gsub(contents, "%s", "")

    return endpoint
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
    hook.Remove("Initialize","CFC_RestartAlerter")
    hook.Add("Initialize", "CFC_RestartAlerter", alertOfRestart)
    printLog("The restart script has been enabled!")
end
