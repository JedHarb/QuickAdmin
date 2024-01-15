; AHK V1.1 64-bit

#SingleInstance, Force				; Reloading the script will replace the previous running script without a prompt.
SendMode, Input					; For anything using Send, Input is a preferred method because of its superior speed and reliability.
SetBatchLines, -1				; Make the script run at maximum speed. If you need the script to use less CPU, remove this or comment it out.

Clicked(){ ; Not in order, but that doesn't matter.
	Switch RegExReplace(A_GuiControl, "\s") {
		case "SystemProperties":	Run, sysdm.cpl
		case "ComputerManagement":	Run, compmgmt.msc
		case "DisplayProperties":	Run, desk.cpl
		case "Services":		Run, services.msc
		case "PerformanceOptions":	Run, SystemPropertiesPerformance.exe
		case "TimeandDate":		Run, timedate.cpl
		case "PowerOptions":		Run, powercfg.cpl
		case "PowerButton":
			Run, powercfg.cpl
			WinWaitActive, Power Options
			Send, {Tab}{Enter}
		case "Programs":		Run, appwiz.cpl
		case "DomainandName":			
			Run, sysdm.cpl
			WinWaitActive, System Properties
			Send, {Tab}c
		case "MouseSpeed":
			Run, main.cpl
			WinWaitActive, Mouse Properties
			Send, +{Tab}{Right 2}{Tab}
		case "NetworkConnections":	Run, ncpa.cpl
		case "SoundPanel":		Run, mmsys.cpl
		case "UserAccounts":		Run, Netplwiz.exe
		case "UserProfiles":
			Run, sysdm.cpl
			WinWaitActive, System Properties
			Send, +{Tab}{Right 2}{Tab 2}{Enter}
		case "DeviceManager":		Run, hdwwiz.cpl
		case "SystemInfo":		Run, msinfo32.exe
		case "WindowsFeatures":		Run, OptionalFeatures.exe
		case "RegistryEditor":		Run, regedit.exe
		case "ControlPanel":		Run, Control
		case "ExplorerPrinters":	Run, ::{2227A280-3AEA-1069-A2DE-08002B30309D}
		case "ControlPrinters":		Run, Control Printers
		case "StartupMenu":		Run, ms-settings:startupapps
		case "YourStartupApps":		Run, shell:Startup
		case "SystemConfiguration":	Run, msconfig.exe
		case "CommonStartupApps":	Run, shell:Common Startup
		case "FileExplorerOptions":	Run, control folders
		case "UserAccountControl":	Run, UserAccountControlSettings
		case "Checkforupdates":		Run, ms-settings:windowsupdate-action
		case "MapNetworkDrive":		Run, rundll32.exe shell32.dll`,SHHelpShortcuts_RunDLL Connect
		case "PrintManagement":		Run, printmanagement.msc
		case "DiskCleanup":		Run, cleanmgr.exe
	}
	return
}

; Would normally make this an associative array, but it doesn't preserve the order of the array. Using linear array of data pairs to accomplish this.
GuiNameIcon :=	[["Computer Management",	"mmc.exe"]
				,["System Properties",		"sysdm.cpl"]
				,["User Profiles",		"Netplwiz.exe"]
				,["Programs",			"OptionalFeatures.exe"]

				,["System Info",		"msinfo32.exe"]
				,["Domain and Name",		"sysdm.cpl"]
				,["User Accounts",		"Netplwiz.exe"]
				,["Network Connections",	"ncpa.cpl"]

				,["System Configuration",	"msconfig.exe"]
				,["Performance Options",	"SystemPropertiesPerformance.exe"]
				,["Power Options",		"powercfg.cpl"]
				,["Explorer Printers",		"printui.exe"]

				,["Startup Menu",		"explorer.exe"]
				,["Display Properties",		"sysdm.cpl"]
				,["Power Button",		"powercfg.cpl"]
				,["Control Printers",		"printui.exe"]

				,["Common Startup Apps",	"explorer.exe"]
				,["Time and Date",		"timedate.cpl"]
				,["Device Manager",		"hdwwiz.cpl"]
				,["Mouse Speed",		"main.cpl"]
				
				,["Your Startup Apps",		"explorer.exe"]
				,["File Explorer Options",	"explorer.exe"]
				,["User Account Control",	"UserAccountControlSettings.exe"]
				,["Check for updates",		"MusNotifyIcon.exe"]

				,["Windows Features",		"OptionalFeatures.exe"]
				,["Map Network Drive",		"ncpa.cpl"]
				,["Sound Panel",		"mmsys.cpl"]
				,["Control Panel",		"control.exe"]

				,["Registry Editor",		"regedit.exe"]
				,["Print Management",		"printui.exe"]
				,["Disk Cleanup",		"cleanmgr.exe"]
				,["Services",			"SystemSettingsBroker.exe"]]

Gui, Font, s10 cWhite, Arial
Gui, Color, Black

For key, pair in GuiNameIcon {
	Gui, Add, Picture, % (Mod(A_Index, 4) = 1 ? "xm" : "xp+150") " gClicked v" RegExReplace(pair[1], "\s") " w15 h15", % pair[2]
	Gui, Add, Text, gClicked xp+20, % pair[1]
}

Gui, Show,, Quick Admin
return

GuiClose:
	ExitApp
return
