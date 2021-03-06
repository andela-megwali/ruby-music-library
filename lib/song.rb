class Song
  include Concerns
  
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song self
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song self
  end
end