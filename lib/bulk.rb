class Bulk

  require 'csv'

  @bios_array = {}

  CSV.foreach("public/uploads/artists_bios.csv", encoding: 'utf-8', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    @bios_array[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end

  @reviews_array = {}

  CSV.foreach("public/uploads/album_reviews.csv", encoding: 'utf-8', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    @reviews_array[row.fields[0]+row.fields[1]] = Hash[row.headers[2..-1].zip(row.fields[2..-1])]
  end

  def self.dbload


    Dir.glob("public/uploads/song/*/*/*.mp3") do |mp3file|

      @mp3path = open(mp3file.to_s, "rb")
      @id3tags = ID3Tag.read(@mp3path)
      
      @artist_name_id3 = @id3tags.artist
      @album_name_id3 = @id3tags.album
      @song_name_id3 = @id3tags.title
      @song_year_id3 = @id3tags.year
      
      if @id3tags.genre
        @genre_id3 = @id3tags.genre.gsub(/\,/,"").strip
      end

      if @id3tags.get_frames(:TRCK).first
        @song_track_id3 = @id3tags.get_frames(:TRCK).first.content
      elsif @id3tags.get_frames(:TRCK).last
        @song_track_id3 = @id3tags.get_frames(:TRCK).last.content
      else
        @song_track_id3 = 1
      end

      if @id3tags.get_frames(:TIT1).first
        @song_video = @id3tags.get_frames(:TIT1).first.content
      elsif @id3tags.get_frames(:TIT1).last
        @song_video = @id3tags.get_frames(:TIT1).last.content
      else
        @song_video = nil
      end

      if @id3tags.get_frames(:TPOS).first
        @song_discnum_id3 = @id3tags.get_frames(:TPOS).first.content
      elsif @id3tags.get_frames(:TPOS).last
        @song_discnum_id3 = @id3tags.get_frames(:TPOS).last.content
      else
        @song_discnum_id3 = 1
      end

      if @id3tags.get_frames(:COMM)
        if @id3tags.get_frames(:COMM).last
          @extras = @id3tags.get_frames(:COMM).last.content.split('%')
        elsif @id3tags.get_frames(:COMM).first && @id3tags.get_frames(:COMM).first.content != "0"
          if @id3tags.get_frames(:COMM).first.content
            @extras = @id3tags.get_frames(:COMM).first.content.split('%')
          end
        else
          #@extras = [1, '-', '-', '', '']
          @extras = [1, '-', '-']
        end
      else
        #@extras = [1, '-', '-', '', '']
        @extras = [1, '-', '-']
      end

      if @id3tags.get_frames(:USLT)
        if @id3tags.get_frames(:USLT).first
          @lyrics = @id3tags.get_frames(:USLT).first.content
        elsif @id3tags.get_frames(:USLT).last
          @lyrics = @id3tags.get_frames(:USLT).last.content
        else
          @lyrics = ''
        end
      else
        @lyrics = ''
      end

      @artist_db = Artist.find_by(name: @artist_name_id3)

      if @artist_db
        @album_db = @artist_db.albums.find_by(name: @album_name_id3)
        if @album_db
          @song_db = @album_db.songs.find_by(name: @song_name_id3)
          unless @song_db
            create_song
          end
        else
          create_album
          create_song
        end
      else
        create_artist
        create_album
        create_song
      end

      @mp3path.close
    
    end
  
  end

  def self.create_artist
    I18n.locale = :en
    image_file = 'public/uploads/images/artists/' + @artist_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    unless File.exists?(image_file)
      @artist_db = Artist.create(name: @artist_name_id3, bio: @bios_array[@artist_name_id3][:en], genre_id: Genre.find_by(name:@genre_id3).id, city: @extras[1], external_url: @extras[2], user_id: 1)    
    else
      @artist_db = Artist.create(name: @artist_name_id3, bio: @bios_array[@artist_name_id3][:en], genre_id: Genre.find_by(name:@genre_id3).id, city: @extras[1], external_url: @extras[2], user_id: 1, image: File.open(image_file, 'rb'))
    end
    I18n.locale = :es
    @artist_db.update_attributes(bio: @bios_array[@artist_name_id3][:es])
  end

  def self.create_album
    I18n.locale = :en
    cover_file = 'public/uploads/images/albums/' + @artist_name_id3.gsub(/\s+/, "").downcase + '-' + @album_name_id3.gsub(/\s+/, "").downcase + '.jpg'
    unless File.exists?(cover_file)
      @album_db = @artist_db.albums.create(name: @album_name_id3, review: @reviews_array[@artist_name_id3+@album_name_id3][:en], year: @song_year_id3, genre_id: Genre.find_by(name:@genre_id3).id, format_id: @extras[0], user_id: 1)
    else
      @album_db = @artist_db.albums.create(name: @album_name_id3, review: @reviews_array[@artist_name_id3+@album_name_id3][:en], year: @song_year_id3, genre_id: Genre.find_by(name:@genre_id3).id, format_id: @extras[0], user_id: 1, cover: File.open(cover_file, 'rb'))
    end
    I18n.locale = :es
    @album_db.update_attributes(review: @reviews_array[@artist_name_id3+@album_name_id3][:es])
  end

  def self.create_song
    I18n.locale = :en
    @album_db.songs.create(name: @song_name_id3, filename: @mp3path, track: @song_track_id3, discnum: @song_discnum_id3, genre_id: @album_db.genre.id, lyrics: @lyrics, video: @song_video, user_id: 1)
  end

end