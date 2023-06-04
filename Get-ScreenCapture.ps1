[CmdletBinding()]
	param (
	[string]$OfWindowTitle = $null,
	[string]$IndexRange = "1"
	)
function Get-ScreenCapture
{
	Param (
	[string]$OfWindowTitle = $null,
	[string]$IndexRange = "1"
	)

	begin {
	Add-Type @"
	using System;
	using System.Drawing;
	using System.Runtime.InteropServices;
	public class UserWindows {
		[DllImport("user32.dll")] public static extern IntPtr  GetForegroundWindow();
		[DllImport("user32.dll")] public static extern Boolean SetForegroundWindow(IntPtr hwnd);
		[DllImport("user32.dll")] public static extern Boolean AllowSetForegroundWindow(Int32  processId);
}
"@

		Add-Type -AssemblyName System.Drawing
		Add-Type -AssemblyName System.Windows.Forms
		$jpegCodec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
			Where-Object { $_.FormatDescription -eq "JPEG" }
		$pngCodec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
			Where-Object { $_.FormatDescription -eq "PNG" }
	}
	process {
		Start-Sleep -Milliseconds 250
		$ActiveHandle=0
		$ep = New-Object Drawing.Imaging.EncoderParameters
		$ep.Param[0] = New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)
		if ( $OfWindowTitle ) {
			$processes=(Get-Process | ? {$_.MainWindowTitle -match $OfWindowTitle})
			if ( $processes.Count -lt 1 )
			{
				Write-Error "No Window with title matching $OfWindowTitle found."
				exit 1
			}
			$ActiveHandle = [UserWindows]::GetForegroundWindow()
			$ASFW_ANY = New-Object System.Int32
			$ASFW_ANY = -1
			$res = [UserWindows]::AllowSetForegroundWindow($ASFW_ANY)
			$left = ''
			$e = $IndexRange -replace ","," "
			$e = $e -replace "[aA][lL][lL]","0-50"
			ForEach ( $r in $e.Split("-") )
			{
				if ( $left )
				{
					$right=$r -replace '\s.*$',''
					$genRange = If( $right.ToInt32($null) - $left.ToInt32($null)  -gt 1) { ( ($left.ToInt32($null)+1)..($right.ToInt32($null)-1) ) } : {''}
					$e = $e -replace '(.*?)-(.*)', "`${1} ${genRange} `${2}"
				}
				$left=$r -replace '^.*\s',''
			}
			$e = $e -replace '\s+', ' '
			$e = $e.Split(' ') | % { $_.ToInt32($null) } | Sort-Object -Unique
			# $e
			$idx = 0
			ForEach ($p in $processes)
			{
				$idx=$idx+1
				if ( ! $idx -in $e ) { continue; }
				Write-Host "Capturing" $p.MainWindowTitle "with pid(" $p.Id ") @ "
				$ToCaptureWindowHandle=$p.MainWindowHandle
				$res=[UserWindows]::SetForegroundWindow($ToCaptureWindowHandle)
				$title=$p.Name + '_' + $p.id
				Start-Sleep -Milliseconds 250
				[Windows.Forms.Sendkeys]::SendWait("%{PrtSc}")
				Start-Sleep -Milliseconds 250
				$bitmap = [Windows.Forms.Clipboard]::GetImage()
				$screenCapturePath = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders').'My Pictures' + "\" + "screenshot_" + $title + "_" + (Get-Date -Format "dddd_dd_MMM_yyyy_HH_mm_ss") + ".jpeg"
				Write-Host $screenCapturePath
				$bitmap.Save(${screenCapturePath}, $jpegCodec, $ep)
			}
			$res=[UserWindows]::SetForegroundWindow($ActiveHandle)
		} else {
			$title="FullScreen"
			Write-Host "Capturing" $title
			[Windows.Forms.Sendkeys]::SendWait("{PrtSc}")
			Start-Sleep -Milliseconds 250
			$bitmap = [Windows.Forms.Clipboard]::GetImage()
			$screenCapturePath = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders').'My Pictures' + "\" + "screenshot_" + $title + "_" + (Get-Date -Format "dddd_dd_MMM_yyyy_HH_mm_ss") + ".jpeg"
			Write-Host $screenCapturePath
			$bitmap.Save(${screenCapturePath}, $jpegCodec, $ep)
		}
	}
}
Get-ScreenCapture $OfWindowTitle $IndexRange