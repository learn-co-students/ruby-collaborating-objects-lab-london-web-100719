class Artist 
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name 
        @@all << self
        songs = []
    end 
    
    def self.all
        @@all
    end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def add_song(song)
        song.artist = self
    end 

    def self.find_or_create_by_name(name)
        varr1 = @@all.select {|artist|  artist.name == name}[0]
        if !varr1 
            varr1 = Artist.new(name)
        end 
        return varr1
    end 

    def print_songs
        self.songs.each {|element| puts element.name}
    end 
end 