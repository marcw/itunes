(* Creates smart playlists of media added by dates. *)
(* Works with iTunes 11 *)

on createSmartPlaylist(start_y, start_m)
	set end_m to 1 + start_m
	set end_y to start_y
	
	if (end_m = 13) then
		set end_m to 1
		set end_y to end_y + 1
	end if
	
	tell application "iTunes" to activate
	tell application "System Events"
		key code 53
		delay 3
		keystroke "n" using {command down, option down}
		delay 3
		keystroke tab
		click
		delay 3
		keystroke "d"
		delay 3
		keystroke tab
		keystroke "is in the range"
		delay 3
		keystroke tab
		keystroke (start_y as string)
		keystroke tab
		keystroke (start_m as string)
		keystroke tab
		keystroke "01"
		keystroke tab
		keystroke (end_y as string)
		keystroke tab
		keystroke (end_m as string)
		keystroke tab
		keystroke "01"
		keystroke tab
		delay 3
		keystroke return
		delay 3
		keystroke ((start_y as string) & "/" & start_m as string)
		delay 3
		keystroke return
	end tell
end createSmartPlaylist

repeat with y from 2005 to 2012
	repeat with m from 1 to 12
		createSmartPlaylist(y, m)
	end repeat
end repeat