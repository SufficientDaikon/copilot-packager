$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$cutoff = (Get-Date).AddMinutes(-30)
$artifact = Get-ChildItem -Path $cwd -Recurse -Filter "README.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -gt $cutoff } | Select-Object -First 1
if ($artifact) {
    $msg = "Package saved: $($artifact.FullName)`n`nPackage is ready. Check the README and docs/ for the documentation website.`n`nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"
    $output = @{ systemMessage = $msg } | ConvertTo-Json -Compress
    Write-Host $output
} else {
    Write-Host '{"continue":true}'
}
