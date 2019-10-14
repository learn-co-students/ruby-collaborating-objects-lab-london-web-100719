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
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        self.all.each do |artist| 
            if artist.name == artist_name
                return artist
            end
        end
        Artist.new(artist_name)
    end

    def print_songs
        self.songs.each do |song| 
            puts song.name if song.artist == self 
        end
        
    end


end