#variables
$AuthorizationToken = "1234"
$url = "https://resone.demo.local/Automation/API/Schedule/Schedule"
$body = @"
{
    "description":  "easy job",
    "type":  "Runbook",
    "when":  {
                 "type":  "Immediate"
             },
    "what":  [
                 {
                     "type":  "Runbook",
                     "id":  "48ef23b6-cb5d-47a7-9377-ca65543638a7",
                     "name":  "easy job"
                 }
             ],
    "whoRequired":  false,
    "who":  [

            ],
    "parameters":  [

                   ],
    "parameterValues":  {

                        },
    "outsideLaunchWindow":  "LaunchWindowFailJob",
    "scheduled":  true,
    "scheduleInParallel":  false
}
"@

#$body = $body | ConvertTo-Json

#create ROA request header
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", 'application/json')
$headers.Add("Authorization", $AuthorizationToken)

#Schedule en get Schedule.id
$respons1 = Invoke-RestMethod $url -Method Post -Headers $headers -Body $body -ContentType "text/json"

#show response
$respons1