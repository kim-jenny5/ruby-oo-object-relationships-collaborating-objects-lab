class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
    #   test_music_path = "./spec/fixtures/mp3s"
    #   test_music_path = "./spec/fixtures/mp3s"
      Dir.entries(path).select do |songs|
        songs.include?("mp3")
      end
    end

    def import
        files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end