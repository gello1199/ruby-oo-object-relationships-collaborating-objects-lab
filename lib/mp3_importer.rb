require 'pry'

class MP3Importer
    attr_accessor :path

    @@all = []

    def initialize(path)
       @path = path
    end

    def files
        # @files = Dir.glob("#{@path}/*.mp3")
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end

    def import
       files.each {|file| Song.new_by_filename(file)} 
    end
end