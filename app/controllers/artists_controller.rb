class ArtistsController < ApplicationController

  respond_to :html, :js

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
    @songs = @artist.songs
  end

  def artist_summary
    @artist = Artist.find_by(name: params[:artist_name])

    respond_with(@artist) do |format|
    format.html {render :partial => "artist_summary" }
    end
  
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

  def destroy
    @artist = Artist.find(params[:id])
    name = @artist.name
    if @artist.destroy
      flash[:notice] = t(:artist_destroyed)
      redirect_to artists_path
    else
      flash[:error] = t(:artist_destroy_error)
      render :show
    end
  end

private

  def artist_params
    params.require(:artist).permit(:name, :city, :url, :active, :bio, :image )
  end

end