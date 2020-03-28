require "pry"
class Artist

    attr_accessor :name

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_str)
        # iterate through all artist instances
        # return array of artist name strings
        artist_names = self.all.map {|artist| artist.name}
        # if name string matches "Drake" == "Drake"
        if artist_names.include?(artist_str)
            # return the instance of the artist
            artist = self.all.find{|artist| artist.name == artist_str}
            artist
        else
            Artist.new(artist_str)
        end
    end

    def print_songs
        puts self.songs.map{|song| song.name}
    end
end