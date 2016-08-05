module Concerns
  module MusicBase
    def all
      class_variable_get :@@all
    end

    def destroy_all
      all.clear
    end

    def create(name)
      new(name).save
    end
  end

  module MusicStore
    def save
      self.class.all << self
      self
    end
  end
end