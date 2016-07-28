class Song < Music
  def initialize(name, artist = "Unknown", genre = "Unset")
    @name = name
    self.artist = artist if artist != "Unknown"
    self.genre = genre if genre != "Unset"
  end

  def artist= artist
    @artist = artist
    @artist.add_song(self)
  end

  def genre= genre
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    all.each {|x| return x if x.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end