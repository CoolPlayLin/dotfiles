# set encoding to UTF-8
[Console]::InputEncoding = [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$env:PYTHONIOENCODING = 'utf-8'

# Import Module
Import-Module Terminal-Icons
Import-Module PSFzf

# the fuck
function fuck {
  if (!(Get-Command fuck -ErrorAction SilentlyContinue)){
    Write-Host "Error: the fuck has not installed" -ForegroundColor Red
    return
  }
  $history = (Get-History -Count 1).CommandLine;
  if (-not [string]::IsNullOrWhiteSpace($history)) {
    $fuck = $(thefuck $args $history);
    if (-not [string]::IsNullOrWhiteSpace($fuck)) {
      if ($fuck.StartsWith("echo")) { $fuck = $fuck.Substring(5); }
      else { Invoke-Expression "$fuck"; }
    }
  }
  [Console]::ResetColor()
}

# Open the folder you wanted
function OpenCurrentFolder {
  param (
    $Path = "."
  )
  Invoke-Item $Path
}

function Select-Items {
  param (
    $command = "pwsh"
  )
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Push-Git {
  param (
    $remote = "origin",
    $branch = "master"
  )
  git push $remote $branch
}

function Open-Server {
  if (Get-Item dist -ErrorAction SilentlyContinue){
    live-server --open=dist
  } else {
    live-server --open=.
  }
}
# Settings
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias -Name ll -Value ls
Set-Alias -Name g -Value git
Set-Alias -Name cz -Value czg
Set-Alias -Name cl -Value cls
Set-Alias -Name open -Value OpenCurrentFolder
Set-Alias -Name o -Value OpenCurrentFolder
Set-Alias -Name which -Value Select-Items
Set-Alias -Name push -Value Push-Git
Set-Alias -Name p -Value Push-Git
Set-Alias -Name serve -Value Open-Server

# Resolve conflict with ni(https://github.com/antfu/ni)
Remove-Alias -Name ni -Force -ErrorAction Ignore
Set-Alias -Name nf -Value New-Item
Set-Alias -Name n -Value ni

# Setup personal workspace via aliae
if (Get-Command -Name aliae -ErrorAction SilentlyContinue) {
  aliae init pwsh --config $env:USERPROFILE\.config\.aliae.yaml | Invoke-Expression
}
else {
  Write-Host "Warning: aliae has not installed" -ForegroundColor Yellow
}

# Setup auto completion for pnpm via script
if (Get-Command -Name pnpm -ErrorAction SilentlyContinue) {
  . $PSScriptRoot\pnpm.ps1
} else {
  Write-Host "Warning: pnpm has not installed" -ForegroundColor Yellow
}

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue){
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\night-owl.omp.json" | Invoke-Expression
} else {
  Write-Host "Warning: Ohmyposh has not installed" -ForegroundColor Yellow
}
