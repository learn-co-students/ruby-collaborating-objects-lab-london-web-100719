require 'pry'

class MP3Importer

    attr_accessor :path, :files
    

    def initialize(file_path)
        @path=file_path
    end

    def files
        file_names=Dir.children(@path)
    end

    def import 
        file_names=files

        file_names.each do |file_name|
            Song.new_by_filename(file_name)
        end

        #binding.pry
    end

end