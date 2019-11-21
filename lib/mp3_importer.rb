class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children(@path).each {|file|}
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
        #Dir.children(@path).each {|file| Song.new_by_filename(file)} #This works as well!
    end

end