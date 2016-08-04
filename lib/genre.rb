require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
  end

  def add_song(song)
    song.genre ||= self.name
    @songs << song if !(@songs.include? song)
  end

  def artists
    @songs.each {|x| @artist << x.artist if !(@artist.include? x.artist)}
    @artist
  end
end