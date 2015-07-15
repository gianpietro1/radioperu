class Bulk

  I18n.locale = :en

  require 'csv'

  @bios_array = {}
  @artists_en_array = []
  @artists_bios_es_hash = Hash.new
  @albums_en_array = []
  @songs_en_array = []

  CSV.foreach("public/artists_bios.csv", encoding: 'utf-8', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    @bios_array[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end

  def self.dbload
    Dir.glob("**{,/*/**}/*.mp3") do |mp3file|

      mp3path = open(mp3file.to_s, "rb")
      @id3tags = ID3Tag.read(mp3path)
      
      @artist_name_id3 = @id3tags.artist
      @album_name_id3 = @id3tags.album
      @song_name_id3 = @id3tags.title
      @song_year_id3 = @id3tags.year
      
      if @id3tags.genre
        @genre_id3 = @id3tags.genre.gsub(/\,/,"").strip
      end

      if @id3tags.track_nr.first
        @song_track_id3 = @id3tags.track_nr.first
      end

      if @id3tags.get_frames(:TPOS).first
        @song_discnum_id3 = @id3tags.get_frames(:TPOS).first.content.first
      else
        @song_discnum_id3 = 1
      end

      if @id3tags.get_frames(:COMM)
        @extras = @id3tags.get_frames(:COMM).last.content.split('-')
      else
        @extras = [1, '-', '-']
      end

      @artist = Artist.find_by(name: @artist_name_id3)

      if @artist
        @album = @artist.albums.find_by(name: @album_name_id3)
        if @album
          @song = @album.songs.find_by(name: @song_name_id3)
          unless @song
            create_song(mp3file)
          end
        else
          create_album
          create_song(mp3file)
        end
      else
        create_artist
        create_album
        create_song(mp3file)
      end

      mp3path.close
    
    end
  
    insert_artists
    insert_albums
    insert_songs
    update_bios

  end

  def self.create_artist
    I18n.locale = :en
    image_file = 'public/uploads/images/artists/' + @artist_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    if File.exists?(image_file)
      @artist_db = {name: @artist_name_id3, bio: @bios_array[@artist_name_id3][:en], genre_id: Genre.find_by(name:@genre_id3).id, city: @extras[1], external_url: @extras[2], user_id: 1, image: File.open(image_file, 'rb') }
    else
      @artist_db = {name: @artist_name_id3, bio: @bios_array[@artist_name_id3][:en], genre_id: Genre.find_by(name:@genre_id3).id, city: @extras[1], external_url: @extras[2], user_id: 1 }
    end
    @artists_en_array << @artist_db
    @artists_bios_es_hash[@artist_name_id3] = @bios_array[@artist_name_id3][:es]
  end

  def self.create_album
    I18n.locale = :en
    cover_file = 'public/uploads/images/albums/' + @artist_name_id3.gsub(/\s+/, "").downcase + '-' + @album_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    if File.exists?(cover_file)
      @album_db = {artist_id: Artist.find_by(name: @artist_name_id3).id, name: @album_name_id3, year: @song_year_id3, genre_id: Genre.find_by(name:@genre_id3).id, format_id: @extras[0], user_id: 1, cover: File.open(cover_file, 'rb')}
    else
      @album_db = {artist_id: Artist.find_by(name: @artist_name_id3).id, name: @album_name_id3, year: @song_year_id3, genre_id: Genre.find_by(name:@genre_id3).id, format_id: @extras[0], user_id: 1}
    end
    @albums_en_array << @album_db
  end

  def self.create_song(file)
    I18n.locale = :en
    file = File.open(mp3file, 'rb')
    @song_db = {album_id: Album.find_by(name: @album_name_id3).id, name: @song_name_id3, filename: file, track: @song_track_id3, discnum: @song_discnum_id3, genre_id: Genre.find_by(name:@genre_id3).id, user_id: 1}
    @songs_en_array << @song_db
    file.close
  end

  def self.update_es_bios
    I18n.locale = :es
    Artist.all.map do |artist|
      if @artists_bios_es_hash[artist.name]
        artist.update_attributes(bio: @artists_bios_es_hash[@artist_name_id3])
      end
    end
  end

  def self.insert_artists
    I18n.locale = :en
    Artist.create!(@artists_en_array)
  end

  def self.insert_albums
    I18n.locale = :en
    Album.create!(@albums_en_array)
  end

  def self.insert_songs
    I18n.locale = :en
    Song.create!(@songs_en_array)
  end

end