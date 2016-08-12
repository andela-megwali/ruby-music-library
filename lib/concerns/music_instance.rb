module Concerns
  module MusicStore
    def save
      self.class.all << self
      self
    end
  end
end