require_relative 'concerns/findable.rb'

class Song < Music
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

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre 
  end

  def artist= artist
    @artist = artist
    @artist.add_song(self)
  end

  def genre= genre
    @genre = genre
    @genre.add_song(self)
  end

  # def self.new_from_filename(filename)
  #   artist_name, song_name, genre_name = filename.gsub(".mp3", "").split(" - ")

  #   artist = Artist.find_or_create_by_name(artist_name)
  #   genre = Genre.find_or_create_by_name(genre_name)
  #   Song.new(song_name, artist, genre)
  # end

  # def self.create_from_filename(filename)
  #   new_from_filename(filename).save
  # end
end