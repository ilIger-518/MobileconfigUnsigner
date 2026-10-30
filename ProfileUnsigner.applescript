-- Droplet: drag .mobileconfig files onto the app (or double-click to pick one).
on run
	set chosen to choose file with prompt "Choose a signed .mobileconfig profile" of type {"mobileconfig", "public.data"} with multiple selections allowed
	open chosen
end run

on open theItems
	set okList to {}
	set errList to {}
	repeat with f in theItems
		set inPath to POSIX path of f
		if inPath ends with ".mobileconfig" then
			set outPath to (text 1 thru -14 of inPath) & " Unsigned.mobileconfig"
			try
				do shell script "/usr/bin/security cms -D -i " & quoted form of inPath & " > " & quoted form of outPath
				set end of okList to outPath
			on error msg
				do shell script "/bin/rm -f " & quoted form of outPath
				set end of errList to inPath & ": " & msg
			end try
		else
			set end of errList to inPath & ": not a .mobileconfig file"
		end if
	end repeat

	set report to ""
	if (count of okList) > 0 then
		set AppleScript's text item delimiters to linefeed
		set report to "Created:" & linefeed & (okList as text)
	end if
	if (count of errList) > 0 then
		set AppleScript's text item delimiters to linefeed
		set report to report & linefeed & linefeed & "Failed:" & linefeed & (errList as text)
	end if
	set AppleScript's text item delimiters to ""
	display dialog report with title "Profile Unsigner" buttons {"OK"} default button "OK"
end open
