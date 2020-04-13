class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(title) 
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    song = self.all.select { |song| song.name == title }
    song[0]
  end
  
  def self.find_or_create_by_name(title)
    if !find_by_name(title)
      create_by_name(title)
    else
      find_by_name(title)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
