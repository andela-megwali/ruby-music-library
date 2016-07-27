class Song < Music
  def initialize(name, artist = "Unknown", genre = "Unset")
  @name = name
  
  def artist= artist
    @artist = artist
    @artist.add_song(self)
  end

  def genre= genre
    @genre = genre
    @genre.add_song(self)
  end

  self.artist = artist if artist != "Unknown"
  self.genre = genre if genre != "Unset"

  end

  def self.find_by_name(name)
    self.all.each {|x| x if x.name != name}.pop
  end

  def self.find_or_create_by_name(name)
    self.all.each do |x| 
      if x.name == name
        x
      else
        self.new(name)
      end
    end
   # songs = self.all
    #for song in songs
     # if song.name == name
      #  song
      #else
       # self.new(name)
      #end
    #end
  end
end
