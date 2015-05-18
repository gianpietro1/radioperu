class AlbumsController < ApplicationController

  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])  
    @songs = @album.songs
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @album = Album.new  
    @album.songs.build
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

  private

    def album_params
      params.require(:album).permit(:name, :year, :cover, :review, :format, songs_attributes: [ :id, :discnum, :track, :name, :filename, :length, :_destroy ] )
    end

end