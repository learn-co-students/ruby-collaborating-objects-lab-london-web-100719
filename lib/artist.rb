require 'pry'

class Artist

    attr_accessor :name

    @@all=[]

    def self.all
        @@all
    end

    def initialize(name)
        @name=name
        Artist.all << self
    end

    def songs
        Song.all.select do |song| song.artist==self end
    end

    def add_song(song_instance)
        song_instance.artist=self
    end

    def self.find_or_create_by_name(artist_name)
        

        match = Artist.all.select do |artist|
            artist.name==artist_name
            
        end
       
        match==[] ? Artist.new(artist_name) : match[0]

    end

    def print_songs
        Song.all.each do |song|
            if song.artist==self
                puts song.name
            end
        end
    end

end

# var1 = Artist.new("new_name")
# Artist.find_or_create_by_name("new_name")
# binding.pry    
# puts "eof"