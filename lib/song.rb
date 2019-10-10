require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    #"Action Bronson - Larry Csonka - indie.mp3"
    artist_title_genre = filename.split(" - ")
    artist = artist_title_genre[0]
    title = artist_title_genre[1]

    song = Song.new(title)
    song.artist_name = artist
    song
  end

  def artist_name=(artist)
    @artist = Artist.find_or_create_by_name(artist)
  end
end

=begin
Song
  #initialize with a name
    accepts a name for the song and makes it accessible through an attribute accessor (FAILED - 10)
  #name=
    sets the song name (FAILED - 11)
  #artist=
    sets the artist object to belong to the song (FAILED - 12)
  .all
    returns all existing Song instances (FAILED - 13)
  .new_by_filename
    creates a new instance of a song from the file that's passed (FAILED - 14)
    associates new song instance with the artist from the filename (FAILED - 15)
   (FAILED - 16)

=end