#variables
$AuthorizationToken = "1234"
$url = "https://resone.demo.local/Automation/API/Schedule/Create/"
$id = "48ef23b6-cb5d-47a7-9377-ca65543638a7"
$type = "runbook"

#create ROA request header
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", 'application/json')
$headers.Add("Authorization", $AuthorizationToken)

#Create URL
$url = $url + $id + "?type=" + $type
$respons = Invoke-RestMethod $url -Method Get -Headers $headers

#show response
$respons | Convertto-Json