class Artist
  attr_accessor :name, :songs

@@song_count = 0

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    Song.all.select {|s| s.artist == self}
  end

  def add_song(song)
    @songs << song
    @@song_count += 1
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    @songs << song
    song.artist = self
    add_song(song)
  end

  def self.song_count
    Song.all.count
  end
end