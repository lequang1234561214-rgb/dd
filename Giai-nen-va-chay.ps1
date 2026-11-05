param([switch]$PrepareOnly)
$ErrorActionPreference='Stop'
try {
    $root=$PSScriptRoot
    $launcher=Join-Path $root 'app\VideoFocus-Windows-x64\Start-VideoFocus.cmd'
    if(Test-Path -LiteralPath $launcher){
        Start-Process -FilePath $launcher -WorkingDirectory (Split-Path $launcher -Parent)
        exit 0
    }
    Write-Host 'Video Focus - Preparing the Windows application...'
    Write-Host 'Allow at least 2 GB of free disk space.'
    $manifest=Get-Content -LiteralPath (Join-Path $root 'download-manifest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $archive=Join-Path $root $manifest.name
    if(Test-Path -LiteralPath $archive){
        if((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.sha256){
            throw 'An existing archive has a different checksum. Extract the download to a new empty folder.'
        }
    }else{
        $temporary=$archive+'.partial.'+[Guid]::NewGuid().ToString('N')
        $output=[IO.File]::Open($temporary,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write)
        try{
            foreach($part in $manifest.parts){
                $file=Join-Path $root $part.name
                if(!(Test-Path -LiteralPath $file)){ throw "Missing part: $($part.name). Extract ALL files from the download ZIP." }
                if((Get-Item -LiteralPath $file).Length -ne $part.size){ throw "Incomplete part: $($part.name)" }
                if((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant() -ne $part.sha256){ throw "Checksum mismatch: $($part.name)" }
                Write-Host "Joining $($part.name)..."
                $inputFile=[IO.File]::OpenRead($file)
                try{ $inputFile.CopyTo($output) }finally{ $inputFile.Dispose() }
            }
        }finally{ $output.Dispose() }
        if((Get-FileHash -LiteralPath $temporary -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.sha256){ throw 'Final archive checksum mismatch.' }
        Move-Item -LiteralPath $temporary -Destination $archive
    }
    Write-Host 'Extracting application. This may take a few minutes...'
    $destination=Join-Path $root 'app'
    if(Test-Path -LiteralPath $destination){ throw 'An incomplete app folder already exists. Extract the download into a new empty folder and retry.' }
    Expand-Archive -LiteralPath $archive -DestinationPath $destination
    if(!(Test-Path -LiteralPath $launcher)){ throw 'The application launcher was not found after extraction.' }
    if($PrepareOnly){ Write-Host 'Preparation checksum and extraction: PASS'; exit 0 }
    Write-Host 'Opening Video Focus...'
    Start-Process -FilePath $launcher -WorkingDirectory (Split-Path $launcher -Parent)
    exit 0
}catch{
    Write-Host ('ERROR: '+$_.Exception.Message) -ForegroundColor Red
    exit 1
}
