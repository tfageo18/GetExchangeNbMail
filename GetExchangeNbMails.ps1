add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010

$serveur = "NOM DU SERVEUR"
$start   = "20/08/2018"
$end     = "24/08/2018"

$domaines = Get-AcceptedDomain

Foreach ($domaine in $domaines) {
    $messages = 0
    $messages = Get-MessageTrackingLog -server $serveur -Start $start  -End $end -ResultSize Unlimited |where-object {$_.Recipients -like “*@"+$domaine.Name}
    Write-Host $domaine.name + " : " + $messages.Count
}
