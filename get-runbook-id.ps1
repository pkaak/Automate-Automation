#variables
$AuthorizationToken = "1234"
$url = "https://resone.demo.local/Automation/API/Runbooks/Search"
$searchfor = "easy job"

#create ROA request header
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", 'application/json')
$headers.Add("Authorization", $AuthorizationToken)

#Change searchstring to URI safe format
$searchfor = [uri]::EscapeDataString($searchfor)

#Create URL
$url = $url + "?criteria.pageNumber=1&criteria.pageSize=1&criteria.freeTextFilter=" + $searchfor
$respons = Invoke-RestMethod $url -Method Get -Headers $headers

#get ID from response
$id = $respons.result.id

#show ID
$id