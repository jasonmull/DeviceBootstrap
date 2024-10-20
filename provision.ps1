Write-Host "Upgrading WinGet..."
Add-AppxPackage -Path "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx" -ForceApplicationShutdown
Add-AppxPackage -Path "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -ForceApplicationShutdown

Start-Sleep -s 10

Write-Host "Installing Applications..."
winget install --id=7zip.7zip -e -h --accept-package-agreements --accept-source-agreements
winget install --id=JanDeDobbeleer.OhMyPosh -e -h --accept-package-agreements --accept-source-agreements  
winget install --id=Microsoft.PowerShell -e -h --accept-package-agreements --accept-source-agreements  
winget install --id=Mozilla.Firefox.DeveloperEdition -e -h --accept-package-agreements --accept-source-agreements
winget install --id=Microsoft.Office -e -h --accept-package-agreements --accept-source-agreements
winget install --id=WiresharkFoundation.Wireshark -e -h --accept-package-agreements --accept-source-agreements
winget install --id=Microsoft.VisualStudioCode -e -h --accept-package-agreements --accept-source-agreements
winget install --id=Microsoft.WindowsTerminal -e -h --accept-package-agreements --accept-source-agreements
winget install --id=Microsoft.Sysinternals.Sysmon  -e -h --accept-package-agreements --accept-source-agreements

#Install Powershell Modules
Write-Host "Install Powershell Modules..."
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name PSReadLine -Repository PSGallery -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Oh-My-Posh font install firacode
#Copy-Item -Path a:\Profile.ps1 -Destination $PSHOME\Profile.ps1
