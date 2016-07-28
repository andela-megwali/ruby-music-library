module Concerns
	module Findable
		
    def find_by_name(name)
      all.each {|x| return x if x.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
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