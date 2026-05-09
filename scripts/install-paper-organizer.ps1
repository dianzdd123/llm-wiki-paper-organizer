$skillSource = Join-Path $PSScriptRoot "..\.skills\paper-organizer"
$skillTarget = Join-Path $HOME ".codex\skills\paper-organizer"

New-Item -ItemType Directory -Force $skillTarget | Out-Null
Copy-Item "$skillSource\SKILL.md" "$skillTarget\SKILL.md" -Force

Write-Host "Installed paper-organizer skill to:"
Write-Host $skillTarget
Write-Host "Restart Codex to load the skill."