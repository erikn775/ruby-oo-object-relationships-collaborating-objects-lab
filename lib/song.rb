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
        new_array = name.split(" - ")
        song = self.new(new_array[1])
        song.artist_name = new_array[0]
        song
    end

    def artist_name=(artist_name)
        found_artist = Artist.all.find {|artist| artist.name == artist_name }
        if found_artist == nil 
            found_artist = Artist.new(artist_name)
        end
        @artist = found_artist
    end
end