function Show-Menu {
    param (
        [string[]]$Options,
        [string]$Title = 'Please select a script to run:'
    )

    $selectedIndex = 0

    while ($true) {
        Clear-Host
        Write-Host $Title

        for ($i = 0; $i -lt $Options.Length; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host " [>] $($Options[$i])"
            } else {
                Write-Host " [ ] $($Options[$i])"
            }
        }

        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

        switch ($key.VirtualKeyCode) {
            38 { if ($selectedIndex -gt 0) { $selectedIndex-- } } # Up arrow
            40 { if ($selectedIndex -lt $Options.Length - 1) { $selectedIndex++ } } # Down arrow
            32 { return $Options[$selectedIndex] } # Space bar
            27 { exit } # Escape
        }
    }
}

function Confirm-Selection {
    param (
        [string]$Selection1,
        [string]$Selection2
    )

    while ($true) {
        Clear-Host
        Write-Host "You have selected:"
        Write-Host "1. $Selection1"
        Write-Host "2. $Selection2"
        Write-Host "Press 'Y' to confirm, 'N' to cancel and re-pick, or 'S' to exit."

        $keyInfo = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $keyCode = $keyInfo.VirtualKeyCode

        switch ($keyCode) {
            89 { return $true }    # Y key
            78 { return $false }   # N key
            83 { exit }            # S key
        }
    }
}

function Invoke-Scripts {
    param (
        [string]$Script1,
        [string]$Script2
    )

    Write-Host "RUNNING $Script1" -ForegroundColor Green
    & "$scriptDirectory\$Script1"
    if ($?) {
        Write-Host "RUNNING $Script2" -ForegroundColor Green
        & "$scriptDirectory\$Script2"
    } else {
        Write-Host "The first script failed. Stopping execution." -ForegroundColor Red
    }
}


do {
    # Fetch all .ps1 files in the current directory, excluding the script itself
    $scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
    $selfName = $MyInvocation.MyCommand.Name
    $scripts = Get-ChildItem -Path $scriptDirectory -Filter *.ps1 |
            Where-Object { $_.Name -ne $selfName } |
            ForEach-Object { $_.Name }

    $firstSelection = Show-Menu -Options $scripts
    $scripts = $scripts | Where-Object { $_ -ne $firstSelection }
    $secondSelection = Show-Menu -Options $scripts

    $confirmed = Confirm-Selection -Selection1 $firstSelection -Selection2 $secondSelection
    if ($confirmed) {
        Invoke-Scripts -Script1 $firstSelection -Script2 $secondSelection
        break
    }
} while ($true)
