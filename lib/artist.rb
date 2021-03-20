require 'pry'

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

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.each do |artist|
            if name == artist.name
                return artist
            end
        end
        self.new(name)
    end

    # iu = Artist.new("IU")
    # bts = Artist.new("BTS")

    # binding.pry

    def print_songs
        songs.each do |song|
            puts song.name
        end
        # self.all.each do |artist|
        #    if songs.artist == self
        #     puts songs.name
        #    end
        # end
    end
end