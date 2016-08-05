class MusicLibraryController
  attr_reader :feedback

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    @feedback = Messages
    feedback.welcome_message
    feedback.library_action_menu
  end

  def call(user_input= gets.chomp.downcase)
    if user_input == "exit"
      feedback.library_exit_message
    else
      grant user_input
      call
    end
  end

  def grant(user_input)
    if commands[user_input]
      send(commands[user_input])
      feedback.new_command
    else
      feedback.wrong_input(user_input)
    end
  end

  def commands 
  {"list songs" => :list_songs,
    "list artists" => :list_artists,
    "list genres" => :list_genres,
    "play song" => :play_song,
    "list artist" => :list_artist,
    "list genre" => :list_genre,
    "help" => :help,
  }
  end

  def list_songs
    Song.all.each.with_index(1) do|song, index|
      feedback.list_songs_message(song, index)
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      feedback.list_category_message(artist, index)
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
      feedback.list_category_message(genre, index)
    end
  end

  def play_song
    list_songs
    puts "Type a song number to play the related song:".yellow
    user_input = gets.chomp.to_i
    user_input = 0 if user_input >= Song.all.length
    play = Song.all[user_input-1]
    feedback.play_song_message(play)
  end

  def list_artist
    list_artists
    puts "Type the name of any listed artist to list all their songs".yellow
    list_artist_songs(user_input= gets.chomp.gsub(/[A-Za-z']+/,&:capitalize))
  end

  def list_artist_songs(user_input)
    chosen_artist = Artist.all.detect {|artist| artist.name == user_input}
    if chosen_artist == nil
      feedback.invalid_selection
    else
      feedback.list_artist_message(chosen_artist)
    end
  end

  def list_genre
    list_genres
    puts "Type the name of any listed genre to list songs in that genre".yellow
    list_genre_songs(user_input = gets.chomp.downcase)
  end

  def list_genre_songs(user_input)
    chosen_genre = Genre.all.detect {|genre| genre.name == user_input}
    if chosen_genre == nil
      feedback.invalid_selection
    else
      feedback.list_genre_message(chosen_genre)
    end
  end

  def help
    feedback.library_action_menu
  end
end