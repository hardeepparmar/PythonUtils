[CmdletBinding()]
PARAM(
	[Parameter(Mandatory=$false,Position=0)]
	[Alias("path")]
	[string]$TmpOutFolder = 'C:\cygwin64\tmp\testVid',
	[Parameter(Mandatory=$false,Position=1)]
	[Alias("FPS")]
	[string]$framerate = 24, 
	[Parameter(Mandatory=$false,Position=2)]
	[string]$videoName = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders').'My Video' + "\" + [io.path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name) + "\" + "videograb" +  "_" + (Get-Date -Format "dddd_dd_MMM_yyyy_HH_mm_ss") + ".mp4"
)
function Get-VideoCapture
{
<#
	Referenced from: https://www.reddit.com/r/PowerShell/comments/6zty73/powershell_video_screen_capture_tool/
	.SYNOPSIS
		Simple Screen-Capture done in PowerShell

		Needs ffmpeg: https://www.ffmpeg.org/
	
	.DESCRIPTION
		Simple Screen-Capture done in PowerShell.
		Useful for making tutorial  and demonstration videos

		Also draws a big red dot where your cursor is, if it is in the defined window bounds

		Uses FFMPeg to make a video file
		Video file can then be edited in your fav video editor
		Like Blender :)



	.PARAMETER TmpOutFolder
		The folder to  temporarily keep the jpegs
			Additional - Suspect slow hdd may cause issues


	.PARAMETER framerate
		Framerate used to calculate both how often to take a screenshot
		And what to use to process the ffmpeg call

	.PARAMETER videoName
		Name + Extension to output the video file as
		By default it will be created in 'My Video' folder of the login user.


	.EXAMPLE
		Get-VideoCapture -TmpOutFolder 'C:\cygwin64\tmp\testVid' -Verbose 

	DESCRIPTION
	------------
		Will create a new video file with 'out.mp4' filename in C:\cygwin64\tmp\testVid folder


	OUTPUT
	------------
		N/A



	.NOTES/CREDITS
		Author: Adrian Andersson
		Last-Edit-Date: 13/09/2017
	
	
		Changelog:
		13/09/2017 - New script, cleaned-up from an old one I had saved

#>	

	[CmdletBinding()]
	PARAM(
		[Parameter(Mandatory=$false,Position=0)]
		[Alias("path")]
		[string]$TmpOutFolder = 'C:\cygwin64\tmp\testVid',
		[Parameter(Mandatory=$false,Position=1)]
		[Alias("FPS")]
		[string]$framerate = 24, 
		[Parameter(Mandatory=$false,Position=2)]
		[string]$videoName = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders').'My Video' + "\" + [io.path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name) + "\" + "videograb" +  "_" + (Get-Date -Format "dddd_dd_MMM_yyyy_HH_mm_ss") + ".mp4"
	)
	begin{


		#Return the script name when running verbose, makes it tidier
		write-verbose "===========Executing $($MyInvocation.InvocationName)==========="
		#Return the sent variables when running debug
		Write-Debug "BoundParams: $($MyInvocation.BoundParameters|Out-String)"

		Write-Verbose 'Loading support functions'
		#Simple function that can do a screen-grab
		function Out-screenshot
		{
			param(
				[int]$verStart,
				[int]$horStart,
				[int]$verEnd,
				[int]$horEnd,
				[string]$path,
				[switch]$captureCursor
			)
			$bounds = [drawing.rectangle]::FromLTRB($horStart,$verStart,$horEnd,$verEnd)
			$jpg = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.height
			$graphics = [drawing.graphics]::FromImage($jpg)
			$graphics.CopyFromScreen($bounds.Location,[Drawing.Point]::Empty,$bounds.Size)
			if($captureCursor)
			{
				write-verbose "CaptureCursor is true"
				$mousePos = [System.Windows.Forms.Cursor]::Position
				if(($mousePos.x -gt $horStart)-and($mousepos.x -lt $horEnd)-and($mousePos.y -gt $verStart) -and ($mousePos.y -lt $verEnd))
				{
					write-verbose "Mouse is in the box"
					#Get the position in the box
					$x = $mousePos.x - $horStart
					$y = $mousePos.y - $verStart
					write-verbose "X: $x, Y: $y"
					#Add a 4 pixel red-dot
					$pen = [drawing.pen]::new([drawing.color]::Red)
					$pen.width = 5
					$pen.LineJoin = [Drawing.Drawing2D.LineJoin]::Bevel
					#$hand = [System.Drawing.SystemIcons]::Hand
					#$arrow = [System.Windows.Forms.Cursors]::Arrow
					#$graphics.DrawIcon($arrow, $x, $y)
					$graphics.DrawRectangle($pen,$x,$y, 5,5)
					#$mousePos
				}
			}
			$jpg.Save($path,"JPEG")
		}

		#Since libx264 needs easily divisible numbers,
		#Make a function that finds the nearest even number
		function get-EvenNumber
		{
			Param(
			[int]$number
			)
			if($($number/2) -like '*.5')
			{
				$number = $number-1
			}
			return $number
		}


		Write-Verbose 'Adding a new C# Assembly to get the Foreground Window'
		#This assembly is needed to get the current process
		#So we know when we have gone BACK to PowerShell
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
		Add-Type -AssemblyName system.drawing
		Add-Type -AssemblyName System.Windows.Forms
		$oldPreference = $ErrorActionPreference
		$ErrorActionPreference = 'stop'
		try {
			if(Get-Command ffmpeg) {
			}
		}
		Catch {
			Write-Error 'ffmpeg not found. Please ensure ffmpeg.exe is in your Path Or install ffmpeg in cygiwn via wcinstall ffmpeg'
			return -1
			}
		Finally {
			$ErrorActionPreference=$oldPreference
		}


		Write-Verbose 'Getting THIS POWERSHELL Session handle number so we know what to ignore'
		#This is used in conjunction with the above service, to identify when we get back to the ps window
#		$thisWindowHandle = $(Get-Process -Name *powershell* |Where-Object{$_.MainWindowHandle -eq $([UserWindows]::GetForegroundWindow())}).MainWindowHandle
		$thisWindowHandle = [UserWindows]::GetForegroundWindow()

		Write-Verbose 'Ensuring output folder is ok'
		if(Test-Path $TmpOutFolder -ErrorAction SilentlyContinue)
		{
			Write-Verbose 'Folder exists, will need to remove '
			Write-Warning 'Output folder already exists. This process will recreate it'
			if(!$continue)
			{
				if($($Host.UI.PromptForChoice('Continue','Are you sure you wish to continue', @('No','Yes'), 1)) -ne 1)
				{
					return -1
				}

			}
			Write-Verbose 'Removing existing jpegs in folder and video file if it exists'
			Remove-Item "$TmpOutFolder" -Force -Recurse
		}
		Write-Verbose 'Creating new output folder'
		New-Item -Path $TmpOutFolder -ItemType Directory -Force

		#We need to calculate the sleep-time based on the FPS
		#We want to know how many miliseconds to take a snap - as a whole number
		#Based on the frame-rate
		#This should be accurate enough
		$msWait =[math]::Floor(1/$($framerate/1000)) 



	}process{
		#Get the window size
		# $rh=[int]((Get-CimInstance -ClassName CIM_Display).ScreenHeight | Format-Table -HideTableHeaders | Out-String)
		$rh=[int](Get-CimInstance -ClassName Win32_VideoController)[0].CurrentVerticalResolution
		$vh=[int][System.Windows.Forms.SystemInformation]::VirtualScreen.Height
		$screen_scale_factor=$rh/$vh
		Write-Verbose 'Getting the Window Size'
		Read-Host 'VIDEO RECORD, put mouse cursor in top left corner of capture area and press any key'
		$start = [System.Windows.Forms.Cursor]::Position
		Read-Host 'VIDEO RECORD, put mouse cursor in bottom right corner of capture area and press any key'
		$end = [System.Windows.Forms.Cursor]::Position

		$horStart = get-EvenNumber ($start.x * $screen_scale_factor)
		$verStart = get-EvenNumber ($start.y * $screen_scale_factor)
		$horEnd = get-EvenNumber ($end.x * $screen_scale_factor)
		$verEnd = get-EvenNumber ($end.y * $screen_scale_factor)
		$boxSize = "box size: Xa: $horStart, Ya: $verStart, Xb: $horEnd, Yb: $verEnd, $($horEnd - $horStart) pixels wide, $($verEnd - $verStart) pixles tall"
		Write-Verbose $boxSize
		if($($Host.UI.PromptForChoice('Continue',"Capture will start 2 seconds after this window looses focus. `n Press CTRL+C to emergency stop", @('No','Yes'), 1)) -eq 1)
		{
			#Start up the capture process
			$num = 1 #Iteration number for screenshot naming
			$capture = $false #Switch to say when to stop capture
			#Wait for PowerShell to loose focus
			while($capture -eq $false)
			{
				if([UserWindows]::GetForegroundWindow() -eq $thisWindowHandle)
				{
					write-verbose 'Powershell still in focus'
					Start-Sleep -Milliseconds 60
				}else{
					write-verbose 'Powershell lost focus'
					Start-Sleep -Seconds 2
					$capture=$true
				}
			}
			#Do another loop until PowerShell regains focus
			while($capture -eq $true)
			{
				if([UserWindows]::GetForegroundWindow() -eq $thisWindowHandle)
				{
					write-verbose 'Powershell has regained focus, so exit the loop'
					$capture = $false
				}else{
					write-verbose 'Powershell does not have focus, so capture a screenshot'
					$x = "{0:D8}" -f $num
					$path = "$TmpOutFolder\$x.jpg"
					Out-screenshot -horStart $horStart -verStart $verStart -horEnd $horEnd -verEnd $verEnd -path $path -captureCursor
					$num++
					Start-Sleep -milliseconds $msWait
				}    
			}

		}else{
			return -1
		}


	}

	End{
		Write-Verbose 'Creating video using ffmpeg'
		New-Item -Path (Split-Path $videoName) -ItemType Directory -Force | Out-Null
		$args_mp4 = "-framerate $framerate -i $TmpOutFolder\%08d.jpg -c:v libx264 -vf fps=25 -pix_fmt yuv420p $videoName -y"
		$gifName = $videoName -replace ".mp4$", ".gif"
		$args_gif = "-i $TmpOutFolder\%08d.jpg -vf fps=12,scale=1024:-2 -f gif $gifName -y"
		Start-Process ffmpeg -ArgumentList $args_mp4 -Wait
		Start-Process ffmpeg -ArgumentList $args_gif -Wait
		Write-Host "Output available in " ($videoName -replace '(.*)\\(.*)','$1')

		Write-Verbose 'Cleaning up jpegs'
		Remove-Item "$TmpOutFolder" -Force -Recurse
	}

}
Get-VideoCapture $TmpOutFolder $framerate $videoName

