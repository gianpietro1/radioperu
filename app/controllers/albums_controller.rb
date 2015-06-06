class AlbumsController < ApplicationController

  respond_to :html, :js

  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])  
    @songs = @album.songs
  end

  def album_summary
    @album = Artist.find_by(name: params[:artist_name]).songs.find_by(name: params[:song_name]).album

    respond_with(@album) do |format|
    format.html {render :partial => "album_summary" }
    end
  
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @album = Album.new  
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.build(album_params)
    if @album.save
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
  end

  def update
    @album = Album.find(params[:id])
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
      params.require(:album).permit(:name, :year, :cover, :review, :format, songs_attributes: [ :id, :discnum, :track, :name, :filename, :id3, :_destroy ] )
    end

    def update_id3
      params[:album][:songs_attributes].each do |song|
        if song[1][:id3] == '1'
          song_stored = Song.find_by_name(song[1][:name])
          mp3_path = open(song_stored.filename.path.to_s, "rb")
          @id3tags = ID3Tag.read(mp3_path)
          if @id3tags.title
            song_stored.update_attributes(name: @id3tags.title)
          end
          if @id3tags.track_nr.first
            song_stored.update_attributes(track: @id3tags.track_nr.first)
          end
          if @id3tags.get_frames(:TPOS).first
            song_stored.update_attributes(discnum: @id3tags.get_frames(:TPOS).first.content.first)
          end
        end
      end
    end

end