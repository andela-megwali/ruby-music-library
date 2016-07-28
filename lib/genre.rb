require_relative 'concerns/findable.rb'

class Genre < Music

	extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    @artist = []
  end

  def add_song(song)
    song.genre ||= self.name
    @songs << song unless @songs.include? song
  end

  def artists
    @songs.each {|x| @artist << x.artist unless @artist.include? x.artist}
    @artist
  end
end