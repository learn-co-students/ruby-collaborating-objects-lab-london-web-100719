require "pry"
class MP3Importer
    # parse filenames in spec/fixtures
    # path is ./spec/fixtures
    # sends filenames to Song class

    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        @files = Dir.entries(@path)
        @song_files = @files.select {|file_name| file_name.length > 2}
    end

    def import
        files.each {|file_name| Song.new_by_filename(file_name)}
    end
end