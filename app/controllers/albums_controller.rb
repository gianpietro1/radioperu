class AlbumsController < ApplicationController

  respond_to :html, :js

  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])  
    authorize @album
    @songs = @album.songs
  end

  def album_summary
    @artist = Artist.find_by(name: params[:artist_name])
    if @artist
      @song = @artist.songs.find_by(name: params[:song_name])
      if @song
        @album = @song.album
      else
        @album = nil
      end
    else
      @album = nil
    end

    respond_with(@album) do |format|
    format.html {render :partial => "album_summary" }
    end

  end

  def new
    @artist = Artist.find(params[:artist_id])
    @album = Album.new  
    authorize @album
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.build(album_params)
    authorize @album
    if @album.save
      @album.update_attributes(user_id: @artist.user_id)
      if @album.genre == nil
        @album.genre = @artist.genre
      end
      flash[:notice] = t(:album_saved)
      update_id3
      redirect_to [@artist,@album]      
    else
      flash[:error] = t(:album_create_error)
      render :new
    end    
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])
    authorize @album
  end

  def update
    @album = Album.find(params[:id])
    authorize @album
    @artist = @album.artist
    if @album.update_attributes(album_params)      
      flash[:notice] = t(:album_updated)
      update_id3
      redirect_to [@artist,@album]
    else
      flash[:error] = t(:album_update_error)
      render :edit
    end    
  end

  def destroy
   @album = Album.find(params[:id])
   authorize @album
   @artist = @album.artist
   name = @album.name
    if @album.destroy
      flash[:notice] = t(:album_destroyed)
      redirect_to @artist
    else
      flash[:error] = t(:album_destroy_error)
      render :show
    end
  end

  private

    def album_params
      params.require(:album).permit(:name, :year, :cover, :review, :format_id, :genre_id, songs_attributes: [ :id, :discnum, :track, :name, :filename, :id3, :_destroy ] )
    end

    def update_id3
      params[:album][:songs_attributes].each do |song|
        if song[1][:id3] == '1'

          if Song.find_by_id(song[1][:id])
            song_stored = Song.find_by_id(song[1][:id])
          else
            song_stored = Song.find_by(filename: (song[1][:filename].original_filename.to_s) )
          end
          mp3_path = open(song_stored.filename.path.to_s, "rb")
          @id3tags = ID3Tag.read(mp3_path)

          song_hash = {}
          if @id3tags.title
            song_hash[:name] = @id3tags.title
          end
          if @id3tags.track_nr.first
            song_hash[:track] = @id3tags.title
          end
          if @id3tags.get_frames(:TPOS).first
            song_hash[:discnum] = @id3tags.title            
          end
          song_stored.update_attributes(song_hash) unless song_hash.empty?

        end
      end
    end

end