class Messages
  def self.welcome_message
    puts "\n#{'>' * 22}  Welcome to The Mic music library  #{'<'*22}".green
  end

  def self.library_action_menu
    puts "\nHere's a list of commands to perform actions in the library:".yellow
    puts "*" * 80
    puts "Commands To Browse Full Lists Of Items In The Music Library"
    puts <<-LIST_ACTIONS.cyan
      >>  list songs
          Lists all the songs in the music library \n
      >>  list artists
          Lists all the artists whose songs are in the music library \n
      >>  list genres
          Lists all the song genres available in the music library
    LIST_ACTIONS
    puts "Commands To Play A Selected Song Or Refine A Song List by Category"
    puts <<-FILTER_ACTIONS.cyan
      >>  play song
          Lists all songs in the library and plays any selected song number \n
      >>  list artist
          Displays all songs with corresponding genre of any selected artist \n
      >>  list genre
          Displays all songs with corresponding artist in any selected genre
    FILTER_ACTIONS
    puts "Commands To Get Help Or Quit the Application"
    puts <<-OTHER_ACTIONS.cyan
      >>  help
          Presents this command/action help menu at any time \n
      >>  exit
          Exits the music library
    OTHER_ACTIONS
    puts "*" * 80
    puts "Type a command below to perform an action or exit:".yellow
  end

  def self.new_command
    puts "*" * 80
    puts ">>> Music library commands:".yellow
    puts <<-LIST_COMMANDS.cyan
      list songs, list artists, list genres, play song,
      list artist, list genre, help, exit
    LIST_COMMANDS
    puts "Type a new command below or type 'exit' to quit:".yellow
  end

  def self.invalid_selection
    puts "Invalid selection! Please start again.".red
  end

  def self.wrong_input(user_input)
    puts "#{user_input} is an unrecognised input. Try again.".red
    new_command
  end

  def self.list_songs_message(song, index)
    dotted_line
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}".
      cyan
  end

  def self.list_category_message(category, index)
    dotted_line
    puts "#{index}. #{category.name}".cyan
  end

  def self.play_song_message(play)
    dotted_line
    puts "Playing #{play.artist.name} - #{play.name} - #{play.genre.name} \n".
      green
    if play == Song.all[-1] 
      puts "Enjoy default song or choose a valid one \n".red
    end
  end

  def self.list_occurrence_message(chosen_category)
    chosen_category.songs.each do |song|
      dotted_line
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name} \n".green
    end
  end

  def self.dotted_line
    puts "#{'.' * 80} \n \n"
  end

  def self.library_exit_message
    puts "\n#{'>' * 28}  Music library exited  #{'<'*28} \n".red
  end
end