class Song

    attr_accessor :name, :artist
    attr_reader :artist_name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        file_name_splitted_array = self.get_proper_names(file_name)
        song_just_created = Song.new(file_name_splitted_array[1])
        artist_created_retreived = Artist.find_or_create_by_name(file_name_splitted_array[0])
        song_just_created.artist = artist_created_retreived
        song_just_created
    end

    def self.get_proper_names(file_name)
        delimiters = [' - ']
        file_name_splitted = file_name.split(Regexp.union(delimiters))
        file_name_splitted = file_name_splitted.reject { |each_entry_in_array| each_entry_in_array.empty? }
        file_name_splitted
    end

    def artist_name=(artist_name)
        @artist_name = artist_name
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

end