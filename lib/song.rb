require 'pry'

class Song

    attr_accessor :name, :artist, :artist_name
    #attr_reader :artist_name

    @@all = []

    def initialize(name)

        @name = name
        @@all << self
        
    end

    def self.all

        @@all
        
    end

    def artist_name=(name)

        current_artist = Artist.all.select {|x| x.name == name}[0]
        
        if !current_artist

            current_artist = Artist.new(name)

        end

        self.artist = current_artist
        
    end

    def self.new_by_filename(file_name)

        song_parts = file_name.split(" - ")
        song = Song.new(song_parts[1])
        song.artist_name=(song_parts[0])
        #binding.pry
        song
        
    end
    
end