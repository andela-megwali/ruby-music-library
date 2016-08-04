require_relative 'messages.rb'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    welcome_message
    library_action_menu
  end

  def call(x= gets.chomp.downcase)
    user_input = {
      "list songs" => :list_songs,
      "list artists" => :list_artists,
      "list genres" => :list_genres,
      "play song" => :play_song,
      "list artist" => :list_artist,
      "list genre" => :list_genre,
      "help" => :library_action_menu,
    }
    if user_input.keys.include? x
      send(user_input[x])
      new_command
    elsif x == "exit"
      library_exit_message
    else
      wrong_input(x)
    end
  end

  def list_songs
    Song.all.each.with_index(1) do|song, index|
      list_songs_message(song, index)
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      list_artists_message(artist, index)
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre, index|
      list_genres_message(genre, index)
    end
  end

  def play_song
    list_songs
    puts "Type a song number to play the related song:".yellow
    x = gets.chomp.to_i
    x = 0 if x >= Song.all.length
    play = Song.all[x-1]
    play_song_message(play)
  end

  def list_artist
    list_artists
    puts "Type the name of any listed artist to list all their songs".yellow
    list_artist_songs(x= gets.chomp.gsub(/[A-Za-z']+/,&:capitalize))
  end

  def list_artist_songs(x)
    chosen_artist = Artist.all.detect {|artist| artist.name == x}
    if chosen_artist == nil
      invalid_selection
    else
      list_artist_message(chosen_artist)
    end
  end

  def list_genre
    list_genres
    puts "Type the name of any listed genre to list songs in that genre".yellow
    list_genre_songs(x= gets.chomp.downcase)
  end

  def list_genre_songs(x)
    chosen_genre = Genre.all.detect {|genre| genre.name == x}
    if chosen_genre == nil
      invalid_selection
    else
      list_genre_message(chosen_genre)
    end
  end
end