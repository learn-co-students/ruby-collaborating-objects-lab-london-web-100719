require 'pry'

class MP3Importer

    attr_accessor :path, :files
    
    def initialize(file_path)
        @path = file_path
    end

    def files
        songs = Dir.entries(self.path)[2..]
    end 

    def import 
        self.files.each do |song_file_name|
            Song.new_by_filename(song_file_name)
        end
    end

end