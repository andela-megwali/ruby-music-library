require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre = []
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
    song.artist ||= self
    @songs << song if !(@songs.include? song)
  end

  def genres
    @songs.each {|x| @genre << x.genre if !(@genre.include? x.genre)}
    @genre
  end
end