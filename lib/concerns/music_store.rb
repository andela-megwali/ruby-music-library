module Concerns
  module MusicStore
    def save
      self.class.all << self
      self
    end

    def add_song_action(song)
      @songs << song unless @songs.include? song
    end
  end
end