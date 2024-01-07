Clear-Host
$location = Get-Location
Set-Location $PSScriptRoot

$path = Join-Path $env:APPDATA "GameMakerStudio2\kevin*"

$file = Get-ChildItem $path -Filter "local_settings.json" -Recurse

Copy-Item $file "local_settings.json" -Force

Set-Location $location
