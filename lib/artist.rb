require_relative 'concerns/findable.rb'

class Artist < Music

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    @genre =[]
  end

  def add_song(song)
    song.artist ||= self
    @songs << song unless @songs.include? song
  end

  def genres
    @songs.each {|x| @genre << x.genre unless @genre.include? x.genre}
    @genre
  end
end