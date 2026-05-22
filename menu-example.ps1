#Bare-bones arrow-key menu for Windows PowerShell 5.1+
#Up/Down to highlight, Enter to select

#First, let's define some cars, these will be used in our main menu
$cars = @(
    'Ford Mustang'
    'Chevrolet Corvette'
    'Porsche 911'
    'BMW M3'
    'Toyota Supra'
    'Tesla Model S'
)

#Now, let's define some colors. These will be used in the second menu
$colors = @(
    'Red'
    'Blue'
    'Black'
    'White'
)

#We'll then define a function that shows our arrow based menu
function Show-ArrowMenu {
    param(
        [string]   $Title,
        [string[]] $Options
    )

    if ($Options.Count -eq 0) {
        throw 'Show-ArrowMenu requires at least one option.'
    }

    $index = 0

    while ($true) {
        Clear-Host
        Write-Host $Title
        Write-Host ''

        for ($i = 0; $i -lt $Options.Count; $i++) {
            if ($i -eq $index) {
                Write-Host ('> {0}' -f $Options[$i]) -ForegroundColor Black -BackgroundColor Cyan
            }
            else {
                Write-Host ('  {0}' -f $Options[$i])
            }
        }

        Write-Host ''
        Write-Host 'Use Up/Down arrows, then Enter to select.' -ForegroundColor DarkGray

        $key = [System.Console]::ReadKey($true)

        switch ($key.Key) {
            ([System.ConsoleKey]::UpArrow) {
                if ($index -gt 0) { $index-- }
            }
            ([System.ConsoleKey]::DownArrow) {
                if ($index -lt ($Options.Count - 1)) { $index++ }
            }
            ([System.ConsoleKey]::Enter) {
                return $Options[$index]
            }
        }
    }
}

#We then use the menu above to ask for our favourite car, and our favourite color
$favouriteCar = Show-ArrowMenu -Title 'What is your favourite car?' -Options $cars
$carColor = Show-ArrowMenu -Title 'What colour is your car?' -Options $colors

#Then we output the results
Clear-Host
Write-Host 'You selected:'
Write-Host ('  Car:   {0}' -f $favouriteCar)
Write-Host ('  Color: {0}' -f $carColor)
Write-Host ''
Write-Host 'Goodbye.' -ForegroundColor DarkGray
