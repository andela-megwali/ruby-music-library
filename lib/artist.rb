class Artist
  include Concerns

  attr_accessor :name, :genre, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre = []
  end
  
  def add_song(song)
    song.artist ||= self
    add_song_action(song)
  end

  def genres
    @songs.each do |song|
      @genre << song.genre unless @genre.include? song.genre
    end
    @genre
  end
end