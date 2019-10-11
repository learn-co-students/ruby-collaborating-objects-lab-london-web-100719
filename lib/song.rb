require 'pry'

class Song 

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name 
        Song.all << self 
    end 

    def self.all 
        @@all 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end 


    def self.new_by_filename(filename)
        delimeters = [" - ", "."]
        song_name = filename.split(Regexp.union(delimeters))[1]
        artist = filename.split(Regexp.union(delimeters))[0]
        song = self.new(song_name)
        song.artist_name = artist
        song
    end 


end 