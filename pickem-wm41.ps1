# Define the matchups and their actual winners
$matchups = @(
    "Gunther Vs. Jey Uso",
    "War Raiders Vs. New Day",
    "Rey Fenix Vs. Grande Americano",
    "Jade Cargill Vs. Naomi",
    "La Knight Vs. Jacob Fatu",
    "Tiffany Stratton Vs. Charlotte Flair",
    "Roman Reigns Vs. CM Punk Vs. Seth Rollins",
    "Io Sky Vs. Bianca Belair Vs. Rhea Ripley",
    "Liv Morgan and Raquel Rodriguez Vs. Bayley and Lyra Valkyria",
    "AJ Styles Vs Logan Paul",
    "Bron Breakker Vs. Penta Vs. Finn Balor Vs. Dominik Mysterio",
    "Damien Priest Vs. Drew McIntyre",
    "Randy Orton Vs. Open Challenge",
    "Cody Rhodes Vs. John Cena"
)

$actualWinners = @(
    "Jey Uso", "New Day", "Grande Americano", "Jade Cargill", "Jacob Fatu", "Tiffany Stratton",
    "Seth Rollins", "Io Sky", "Bayley and Lyra Valkyria", "Logan Paul", "Dominik Mysterio",
    "Drew McIntyre", "Randy Orton", "John Cena"
)

# Define user predictions
$predictions = @{
    "G" = @("Gunether", "War Raiders", "Grande Americano", "Jade Cargill", "Jacob Fatu", "Tiffany Stratton", "Seth Rollins", "Io Sky", "Bayley and Lyra Valkyria", "Logan Paul", "Penta", "Damien Priest", "Open Challenger", "John Cena")
    "Curtis" = @("Gunether", "War Raiders", "Rey Fenix", "Jade Cargill", "Jacob Fatu", "Tiffany Stratton", "Seth Rollins", "Io Sky", "Bayley and Lyra Valkyria", "Logan Paul", "Bron Breakker", "Damien Priest", "Open Challenge", "Cody Rhodes")
    "AJ" = @("Jey Uso", "New Day", "Grande Americano", "Jade Cargill", "Jacob Fatu", "Tiffany Stratton", "Seth Rollins", "Rhea Ripley", "Liv Morgan and Raquel Rodriguez", "AJ Styles", "Penta", "Drew McIntyre", "Randy Orton", "John Cena")
    "Stephanie" = @("Jey Uso", "War Raiders", "Rey Fenix", "Jade Cargill", "LA Knight", "Charlotte Flair", "CM Punk", "Io Sky", "Bayley and Lyra Valkyria", "AJ Stykes", "Bron Breakker", "Damien Priest", "Randy Orton", "John Cena")
}

# Calculate scores
$scores = @{}
foreach ($user in $predictions.Keys) {
    $score = 0
    for ($i = 0; $i -lt $actualWinners.Count; $i++) {
        if ($predictions[$user][$i] -eq $actualWinners[$i]) {
            $score++
        }
    }
    $scores[$user] = $score
}

# Determine the winner(s)
$maxScore = $scores.Values | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
$winners = $scores.GetEnumerator() | Where-Object { $_.Value -eq $maxScore } | ForEach-Object { $_.Key }

# Output results
Write-Output "Scores:"
$scores.GetEnumerator() | ForEach-Object { Write-Output "$($_.Key): $($_.Value)" }
Write-Output "`nWinner(s): $($winners -join ', ') with $maxScore points."