require "pry"

class Song
    attr_accessor :name, :artist
    attr_reader :artist_name

    @@all = []

    def initialize(name)
        @name = name
        Song.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(song_name)
    title = song_name.split(".")
    artist_song = title[0].split(" - ")

    song = self.new(song_name)
    song.name = artist_song[1]
    song.artist_name = artist_song[0]

    Song.all << song
    song
    end

    def find_by_name(name)
        Song.all.find {|song| song.artist == name}
    end

    def artist_name=(name)
        self.artist = Artist.find_by_name(name) || Artist.create_by_name(name)
    end


end

song = Song.new("xx")
song1 = Song.new("yy")

puts "s"