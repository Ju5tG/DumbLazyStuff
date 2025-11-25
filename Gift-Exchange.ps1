<#Define the 4 arrays#>

$array1 = @('Jim', 'Leanne', 'Bryson', 'Brooke')
$array2 = @('Jeff', 'Lisa')
$array3 = @('Shell', 'Morgan', 'Jeffrey', 'Joe', 'Cindy 2', 'Verne')
$array4 = @('Cindy', 'Justin', 'Allie', 'Stephanie')
<# Combine all arrays into one #>
$allMembers = $array1 + $array2 + $array3 + $array4

<# Create a function to get a unique random member from the combined array that is not from the same array #>
function Get-UniqueRandomMember($assigned, $sourceArray, $assignedMembers) {
    $validMembers = $sourceArray | Where-Object { $ -ne $assigned -and -not $assignedMembers.Contains($) }
    $validMembers | Get-Random
}

<# Create a hash table to store assignments #>
$assignments = @{}
$assignedMembers = @()

<# Assign members ensuring no one is assigned to themselves or to members of the same array #>
foreach ($member in $array1) {
    $assignments[$member] = Get-UniqueRandomMember $member ($array2 + $array3 + $array4) $assignedMembers
    $assignedMembers += $assignments[$member]
}

foreach ($member in $array2) {
    $assignments[$member] = Get-UniqueRandomMember $member ($array1 + $array3 + $array4) $assignedMembers
    $assignedMembers += $assignments[$member]
}

foreach ($member in $array3) {
    $assignments[$member] = Get-UniqueRandomMember $member ($array1 + $array2 + $array4) $assignedMembers
    $assignedMembers += $assignments[$member]
}

foreach ($member in $array4) {
    $assignments[$member] = Get-UniqueRandomMember $member ($array1 + $array2 + $array3) $assignedMembers
    $assignedMembers += $assignments[$member]
}

<# Output the assignments #>
$assignments.GetEnumerator() | ForEach-Object { "$($.Key) is assigned to $($.Value)" }
$assignments | Format-Table
