class MusicImporter
	attr_accessor :path
  
  def initialize(path)
  	@path = path
  end

  def files
  	@files = []
  	Dir.foreach(path) {|x| @files << x if x[0] != "."}
  	@files
  end

  def import

    files.each {|filename| Song.create_from_filename(filename)}
  end
end