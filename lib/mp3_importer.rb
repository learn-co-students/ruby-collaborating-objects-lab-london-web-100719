class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end 
     
    def files 
        Dir.entries(@path).select {|entry| entry.include? ".mp3"}
    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end 
end 