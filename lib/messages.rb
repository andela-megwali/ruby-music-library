class Messages
  def self.welcome_message
    puts "\n#{'>' * 22}  Welcome to The Mic music library  #{'<'*22}".green
  end

  def self.library_action_menu
    puts "\nHere's a list of commands to perform actions in the library:".yellow
    puts "*" * 80
    library_list_actions
    library_filter_actions
    library_other_actions
  end

  def self.library_list_actions
    puts ">>>  list songs".cyan
    puts "Lists all the songs in the music library \n\n"
    puts ">>>  list artists".cyan
    puts "Lists all the artists whose songs are in the music library \n\n"
    puts ">>>  list genres".cyan
    puts "Lists all the song genres available in the music library \n\n"
  end

  def self.library_filter_actions
    puts ">>>  play song".cyan
    puts "Lists all songs in the library and plays any selected song number\n\n"
    puts ">>>  list artist".cyan
    puts "Lists all songs with corresponding genre of any selected artist \n\n"
    puts ">>>  list genre".cyan
    puts "Lists all songs with corresponding artist in any selected genre \n\n"
  end

  def self.library_other_actions
    puts ">>>  help".cyan
    puts "Presents this command/action help menu at any time \n\n"
    puts ">>>  exit".cyan
    puts "Exits the music library"
    puts "*" * 80
    puts "Type a command below to perform an action or exit:".yellow
  end

  def self.new_command
    puts "*" * 80
    puts ">>> Music library list commands:".yellow
    puts "list songs, list artists, list genres, help".cyan
    puts ">>> Music library selection commands:".yellow
    puts "play song, list artist, list genre".cyan
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