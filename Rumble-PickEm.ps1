# Royal Rumble Pick'em Script
# Fairly distributes numbers 1-30 among an even amount of users
# Constraint: User count must divide evenly into 30

# Input: Array of users
$Users = @("Stephanie","Carolina","Curtis","Brandon","AJ","Justin")

# Validate user count
if ($Users.Count -gt 30) {
    Write-Error "Too many users! Maximum is 30."
    exit
}

if (30 % $Users.Count -ne 0) {
    Write-Error "User count must divide evenly into 30 (e.g., 2, 3, 5, 6, 10, 15, 30)."
    exit
}

# Generate numbers 1-30
$Numbers = 1..30

# Shuffle numbers
$ShuffledNumbers = $Numbers | Sort-Object {Get-Random}

# Calculate picks per user
$PicksPerUser = 30 / $Users.Count

# Assign numbers
$Assignments = @()
for ($i=0; $i -lt $Users.Count; $i++) {
    $StartIndex = $i * $PicksPerUser
    $EndIndex   = $StartIndex + $PicksPerUser - 1
    $UserNumbers = $ShuffledNumbers[$StartIndex..$EndIndex]

    $Assignments += [PSCustomObject]@{
        User    = $Users[$i]
        Numbers = ($UserNumbers -join ", ")
    }
}

# Output results
$Assignments | Format-Table -AutoSize
