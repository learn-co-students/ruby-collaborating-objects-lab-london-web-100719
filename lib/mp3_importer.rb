class MP3Importer

attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select {|files| files.include?(".mp3")}
    end

    def import 

    self.files.each do |element|
        Song.new_by_filename(element)
    end

    end

end