require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :songs
  @@all = []

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