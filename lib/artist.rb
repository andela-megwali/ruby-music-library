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
    @songs.each {|x| @genre << x.genre unless @genre.include? x.genre}
    @genre
  end

end