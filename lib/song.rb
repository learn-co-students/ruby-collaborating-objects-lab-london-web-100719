require "pry"

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

    def self.new_by_filename(file_name)
        file_name_array = file_name.split(" - ")
        artist_name = file_name_array[0]
        song_name = file_name_array[1].gsub(/.mp3/,"")
        
        new_song = Song.new(song_name)
        new_song.artist_name = artist_name
        new_song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
    end

end