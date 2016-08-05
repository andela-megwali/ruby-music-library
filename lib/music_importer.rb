class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files_stored = []
    Dir.foreach(path) {|file| files_stored << file if file[0] != "."}
    files_stored
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
end