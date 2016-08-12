class Genre
  include Concerns

  attr_accessor :name, :artist, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = []
  end

  def add_song(song)
    song.genre ||= self
    add_song_action(song)
  end

  def artists
    @songs.each do |song|
      @artist << song.artist unless @artist.include? song.artist
    end
    @artist
  end
end