Clear-Host
$location = Get-Location
Set-Location $PSScriptRoot

$path = Join-Path $env:APPDATA "GameMakerStudio2\kevin*"

$file = Get-ChildItem $path -Filter "local_settings.json" -Recurse

Copy-Item "local_settings.json" $file -Force

Set-Location $location
