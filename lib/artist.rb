require "pry"

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
        Song.all.select {|song| song.artist == self}
    end

    def add_song(a_song_object)
        a_song_object.artist = self
    end

    def self.find_or_create_by_name(a_name)
        Artist.all.each {|artist| return artist if (artist.name == a_name)}
        Artist.new(a_name)
    end

    def print_songs
        songs.each {|song| puts "#{song.name}"}
    end
end