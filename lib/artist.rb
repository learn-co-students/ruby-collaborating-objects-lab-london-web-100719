require "pry"

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        Artist.all << self unless Artist.all.include?(self)
        
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(new_song)
        new_song.artist = self
    end
    
    def self.find_by_name(name)
        Artist.all.find {|artist| artist.name == name}
    end

    def self.create_by_name(name)
        artist = Artist.new(name)
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end

    def print_songs
       songs.each do |song|
        puts song.name
       end
    end
end

