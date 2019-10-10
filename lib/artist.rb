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

    def songs

        Song.all.select {|element| element.artist == self}

    end

    def add_song(song)

        song.artist = self
        
    end

    def self.find_or_create_by_name(name)

        current_artist = @@all.select {|a| a.name == name}[0]
        
        if !current_artist

            current_artist = Artist.new(name)

        end

        current_artist

    end

    def print_songs

        self.songs.each {|element| puts element.name}
        
    end
    
end