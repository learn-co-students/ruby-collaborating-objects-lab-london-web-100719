class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path 
    end

    def files
        #songs = Dir.entries(self.path)[2..]
        Dir.chdir(@path) do |p|
            Dir.glob("*.mp3")
        end
    end

    def import 
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end

end
