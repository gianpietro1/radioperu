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
      params.require(:album).permit(:name, :year, :cover, :review, :format, songs_attributes: [ :id, :discnum, :track, :name, :filename, :length, :_destroy ] )
    end

end