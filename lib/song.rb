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

    def self.new_by_filename(name)
        artist_name = name.split(" - ")[0]
        song_name = name.split(" - ")[1]
        song = self.new(song_name)
        song.artist_name = artist_name
        song

        # binding.pry
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
    end

end