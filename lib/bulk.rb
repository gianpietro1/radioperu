class Bulk

  require 'csv'

  @bios_array = {}

  CSV.foreach("public/artists_bios.csv", encoding: 'utf-8', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    @bios_array[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end

  def self.dbload
    Dir.glob("**/*mp3") do |mp3file|

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
    I18n.locale = :es
    image_file = 'public/uploads/images/artists/' + @artist_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    if File.exists?(image_file)
      @artist_db = Artist.create(name: @artist_name_id3, image: File.open(image_file, 'rb'), bio: @bios_array[@artist_name_id3][:es], genre: @genre_id3)    
    else
      default_image_file = File.join(Rails.root, 'app/assets/images', 'default_artist.jpg')
      @artist_db = Artist.create(name: @artist_name_id3, image: File.open(default_image_file, 'rb'), bio: @bios_array[@artist_name_id3][:es], genre: @genre_id3)          
    end
    I18n.locale = :en
    @artist_db.update_attributes(bio: @bios_array[@artist_name_id3][:en])
  end

  def self.create_album
    cover_file = 'public/uploads/images/albums/' + @artist_name_id3.gsub(/\s+/, "").downcase + '-' + @album_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    if File.exists?(cover_file)
      @album_db = @artist_db.albums.create(name: @album_name_id3, cover: File.open(cover_file, 'rb'), year: @song_year_id3, genre: @genre_id3)
    else
      default_cover_file = File.join(Rails.root, 'app/assets/images', 'default_album.jpg')
      @album_db = @artist_db.albums.create(name: @album_name_id3, cover: File.open(default_cover_file, 'rb'), year: @song_year_id3, genre: @genre_id3)
    end
  end

  def self.create_song(file)
    @album_db.songs.create(name: @song_name_id3, filename: File.open(file, 'rb'), track: @song_track_id3, discnum: @song_discnum_id3, genre: @genre_id3)
  end

end