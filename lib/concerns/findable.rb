module Concerns::Findable

    def find_by_name(name)
      all.detect {|x| x.name == name}
    end

    def find_or_create_by_name(name)
    	find_by_name(name) || create(name)
    end

  def new_from_filename(filename)
    artist_name, song_name, genre_name = filename.gsub(".mp3", "").split(" - ")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
    #binding.pry
  end

  def create_from_filename(filename)

    new_from_filename(filename).save
  end

end