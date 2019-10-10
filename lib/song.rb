require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)

        song_name = filename.split(" - ")[1]
        song = self.new(song_name)

        song_artist = filename.split(" - ")[0]
        song.artist = Artist.find_or_create_by_name(song_artist)

        return song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end 