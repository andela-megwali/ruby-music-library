module Concerns::Findable

  def find_by_name(name)
    all.detect {|x| x.name == name}
  end

  def find_or_create_by_name(name)
  	find_by_name(name) || create(name)
  end

  def new_from_filename(filename)
    music_name_property = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(music_name_property[0])
    genre = Genre.find_or_create_by_name(music_name_property[2])
    Song.new(music_name_property[1], artist, genre)
  end

  def create_from_filename(filename)
    new_from_filename(filename).save
  end

end