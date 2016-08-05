class Artist
  include Concerns

  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre = []
  end
  
  def add_song(song)
    song.artist ||= self
    @songs << song unless @songs.include? song
  end

  def genres
    @songs.each do |song|
      @genre << song.genre unless @genre.include? song.genre
    end
    @genre
  end
end