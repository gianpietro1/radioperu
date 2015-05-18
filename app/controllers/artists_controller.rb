class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
    @songs = @artist.songs
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      flash[:notice] = t(:artist_saved)
      redirect_to @artist
    else
      flash[:error] = t(:artist_create_error)
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])    
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      flash[:notice] = t(:artist_updated)
      redirect_to @artist
    else
      flash[:error] = t(:artist_update_error)
      render :edit
    end    
  end


private

  def artist_params
    params.require(:artist).permit(:name, :city, :url, :active, :bio, :image )
  end

end