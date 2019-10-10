require 'pry'

class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.map { |filename| filename.split('/').last}
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end

#


=begin
#initialize
accepts a file path to parse mp3 files from (FAILED - 2)
#files
  loads all the mp3 files in the path directory (FAILED - 3)
  normalizes the filename to just the mp3 filename with no path (FAILED - 4)
#import
  imports the files into the library by creating songs from a filename (FAILED - 5)
=end