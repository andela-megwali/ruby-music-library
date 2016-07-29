require_relative 'concerns/findable.rb'

class Genre < Music

	  @@all = []
  attr_accessor :name, :artist, :genre, :songs
  
#   def self.all
#     @@all
#   end

#   def save
#     @@all << self
#     self
#   end

#   def self.destroy_all
#     @@all = []
#   end

#   def self.create(name)
#     self.new(name).save
# #    @@all[-1]
#   end

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