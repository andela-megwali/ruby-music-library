class Artist < Music
  def initialize(name)
  @name = name
  @songs = []
  @genre =[]
  end

  def add_song(song)
    song.artist ||= self
    @songs << song unless self.songs.include? song
  end

  def genres
    songs = self.songs
    for song in songs
      @genre << song.genre unless @genre.include? song.genre
    end
  end

end