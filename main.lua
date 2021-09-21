-- if the playing media is a youtube video, download it with yt-dlp
-- press CTRL+SHIFT+Y to call the function

local mp = require 'mp'
local utils = require 'mp.utils'
local options = require 'mp.options'
local M = {}

function M.get_filename()
	local current_filename = mp.get_property("filename")
	if string.sub(current_filename,1,8) == "watch?v=" 
	then 
		formated_filename = "https://www.youtube.com/" .. current_filename
		yt-dlp_script(formated_filename)
		mp.commandv("show-text", "Downloading current youtube video.", 2000)
    	else
		mp.commandv("show-text", current_filename, 2000)
	end
end


function yt-dlp_script(text)
	--edit path to your folder
	mp.commandv("run", "/home/mauricioquintela/.config/mpv/scripts/mpv-ytdlp/yt-dlp_script.sh", text);
end


function M.bind_ctrl_shift_Y()
	mp.add_key_binding('CTRL+SHIFT+Y', 'check_file_name', M.get_filename)
end


function M.unbind_ctrl_shift_Y()
	mp.remove_key_binding('CTRL+SHIFT+Y')
end


function M.main() 
	M.bind_ctrl_shift_Y()
end

mp.register_event("file-loaded", M.main)
