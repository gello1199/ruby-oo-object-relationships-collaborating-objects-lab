require 'pry'

class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song_list| song_list.artist == self}
    end

    def add_song(artist_song)
        artist_song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.detect {|artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        songs.each {|song_list| puts song_list.name}
    end

end