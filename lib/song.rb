require 'pry'

class Song

    attr_accessor :name, :artist

    @@all=[]


    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end


    def self.new_by_filename(filename)
        
        artist_and_name = filename.split(" - ")
        artist_name     = artist_and_name[0]
        song_name       = artist_and_name[1]
        
        song = Song.new(song_name)

     
        Artist.all.each do |artist|
    
             if artist.name==artist_name
                song.artist=artist
             end

        end

        if song.artist==nil
            song.artist=Artist.new(artist_name)
        end
        

        song
        # binding.pry

    end

    def artist_name(artist_name)
        testing=[]
        #Artist.all.any? {|artist| artist.name==artist} ? testing=True : testing=False
    end


    def artist_name=(artist_name)
        self.artist=Artist.find_or_create_by_name(artist_name)
        #binding.pry
    end

end