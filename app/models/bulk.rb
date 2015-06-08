class Bulk

  def self.dbload
    Dir.glob("**/*mp3") do |mp3file|

      mp3path = open(mp3file.to_s, "rb")
      @id3tags = ID3Tag.read(mp3path)
      
      @artist_name_id3 = @id3tags.artist
      @album_name_id3 = @id3tags.album
      @song_name_id3 = @id3tags.title
      @song_track_id3 = @id3tags.track_nr.first
      if @id3tags.get_frames(:TPOS).first
        @song_discnum_id3 = @id3tags.get_frames(:TPOS).first.content.first
      else
        @song_discnum_id3 = 1
      end

      @artist_db = Artist.find_by(name: @artist_name_id3)

      if @artist_db
        @album_db = @artist_db.albums.find_by(name: @album_name_id3)
        if @album_db
          @song_db = @album_db.songs.find_by(name: @song_name_id3)
          unless @song_db
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

    end
  
  end

  def self.create_artist
    @artist_db = Artist.create(name: @artist_name_id3)
  end

  def self.create_album
    @album_db = @artist_db.albums.create(name: @album_name_id3)
  end

  def self.create_song(file)
    @album_db.songs.create(name: @song_name_id3, filename: File.open(file, 'rb'), track: @song_track_id3, discnum: @song_discnum_id3)
  end

end