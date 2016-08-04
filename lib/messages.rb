def welcome_message
  puts ""
  puts ">>>>>>>>>>>>>  Welcome to The Mic music library  <<<<<<<<<<<<<<<".green
  puts ""
end

def library_action_menu
  puts "Below is a list of commands to perform actions in the library:".yellow
  puts "**********************************************************************"
  puts ">>>  list songs".cyan
  puts "Lists all the songs in the music library"
  puts ""
  puts ">>>  list artists".cyan
  puts "Lists all the artists whose songs are in the music library"
  puts ""
  puts ">>>  list genres".cyan
  puts "Lists all the song genres available in the music library"
  puts ""
  puts ">>>  play song".cyan
  puts "Lists all songs in the library and plays any selected song number"
  puts ""
  puts ">>>  list artist".cyan
  puts "Lists all songs with corresponding genre of any selected artist"
  puts ""
  puts ">>>  list genre".cyan
  puts "Lists all songs with corresponding artist in any selected genre"
  puts ""
  puts ">>>  exit'".cyan
  puts "Exits the music library"
  puts "**********************************************************************"
  puts "Type a command below to perform an action or exit:".yellow
end

def new_command
  puts "**********************************************************************"
  puts ">>> Music library list commands:".yellow
  puts "list songs, list artists, list genres, help"
  puts ">>> Music library selection commands:".yellow
  puts "play song, list artist, list genre"
  puts "Type a new command below or type 'exit' to quit:".yellow
  call
end

def invalid_selection
   puts "Invalid selection! Please start again.".red
end

def wrong_input(x)
  puts "#{x} is an unrecognised input. Try again with a valid command".red
  new_command
end

def list_songs_message(song, index)
  dotted_line
  puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}".cyan
end

def list_artists_message(artist, index)
  dotted_line
  puts "#{index}. #{artist.name}".cyan
end

def list_genres_message(genre, index)
  dotted_line
  puts "#{index}. #{genre.name}".cyan
end

def play_song_message(play)
  dotted_line
  puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name}".green
  if play == Song.all[-1] 
    puts "Enjoy default song or choose a valid one".red
  end
  puts ""
end

def list_artist_message(chosen_artist)
  chosen_artist.songs.each do |song|
    dotted_line
    puts "#{chosen_artist.name} - #{song.name} - #{song.genre.name}".green
    puts ""
  end
end

def list_genre_message(chosen_genre)
  chosen_genre.songs.each do |song|
    dotted_line
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}".green
    puts ""
  end
end

def dotted_line
  puts "......................................................................"
  puts ""
end

def library_exit_message
  puts ">>>>>>>>>>>>>>>>>>>>>  Music library exited  <<<<<<<<<<<<<<<<<<<<<".red
  puts ""
end
