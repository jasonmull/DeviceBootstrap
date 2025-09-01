# Description: Boxstarter Script
# Author: Jason Mull
# Full Device Deployment
Disable-UAC

# Get the base URI path from the ScriptToCall value
$helperUri = "https://raw.githubusercontent.com/jasonmull/DeviceBootstrap/refs/heads/main/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "CommonDesktopTools.ps1";
executeScript "CommonBrowsers.ps1;

# Set a wallpaper : 
write-host "Setting a nice wallpaper"
$web_dl = new-object System.Net.WebClient
$wallpaper_url = "https://www.lsu.edu/communications/images/zoom-backgrounds/lsu-7193-tiger-stadium-sunset.jpg"
$wallpaper_file = "C:\Users\Public\Pictures\lsu.jpg"
$web_dl.DownloadFile($wallpaper_url, $wallpaper_file)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Users\Public\Pictures\lsu.jpb" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_DWORD /d "6" /f 

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
