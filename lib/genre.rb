class Genre < Music
  def initialize(name)
  @name = name
  @songs = []
  end

  def add_song(song)
    song.genre ||= self.name
    @songs << song unless self.songs.include? song
  end

end