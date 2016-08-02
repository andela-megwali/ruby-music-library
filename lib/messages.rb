def welcome_message
	puts ""
  puts ">>>>>>>>>>>>>  Welcome to The Mic music library  <<<<<<<<<<<<<<<".green
  puts ""
end

def library_action_menu
		 puts "Below is a list of commands to perform actions in the library:".yellow
	   puts "*****************************************************************"
	   puts "1. 'list songs'".cyan
	   puts "Lists all the songs in the music library"
	   puts ""
	   puts "2. 'list artists'".cyan
	   puts "Lists all the artists whose songs are in the music library"
	   puts ""
	   puts "3. 'list genres'".cyan
	   puts "Lists all the song genres available in the music library"
	   puts ""
	   puts "4. 'play song'".cyan
	   puts "Lists all songs in the library and plays any selected song number"
	   puts ""
	   puts "5. 'list artist'".cyan
	   puts "Lists all songs with corresponding genre of any selected artist"
	   puts ""
	   puts "6. 'list genre'".cyan
	   puts "Lists all songs with corresponding artist in any selected genre"
	   puts ""
	   puts "7. 'exit'".cyan
	   puts "Exits the music library"
	   puts "*****************************************************************"
	   puts "Type a command below to perform an action:".yellow
end

def new_command
	puts ""
	puts "Type a new command or exit:".yellow
	call
end