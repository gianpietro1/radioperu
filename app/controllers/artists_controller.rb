class ArtistsController < ApplicationController

  respond_to :html, :js

  def index
    @artists = Artist.all
    authorize @artists
  end

  def index_station
    @radio = Radio.find_by_id(params[:station_id])
    @artists = @radio.artists
  end

  def show
    @artist = Artist.friendly.find(params[:id])
    authorize @artist
    @albums = @artist.albums
    @songs = @artist.songs
  end

  def artist_summary
    @artist = Artist.where('lower(name) = ?', params[:artist_name].downcase).first
    respond_with(@artist) do |format|
    format.html {render :partial => "artist_summary" }
    end
  
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def create
    @artist = Artist.create(artist_params)
    authorize @artist
    if @artist.save
      flash[:notice] = t(:artist_saved)
      update_facebook_graph
      redirect_to @artist
    else
      flash[:error] = t(:artist_create_error)
      render :new
    end
  end

  def edit
    @artist = Artist.friendly.find(params[:id])  
    authorize @artist  
  end

  def update
    @artist = Artist.friendly.find(params[:id])
    authorize @artist
    if @artist.update_attributes(artist_params)
      flash[:notice] = t(:artist_updated)
      @artist.send_update_email
      update_facebook_graph
      redirect_to @artist
    else
      flash[:error] = t(:artist_update_error)
      render :edit
    end    
  end

  def destroy
    @artist = Artist.friendly.find(params[:id])
    authorize @artist
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
    params.require(:artist).permit(:name, :city, :external_url, :active, :bio, :image, :genre_id)
  end

  def update_facebook_graph
    url = "https://graph.facebook.com/?id=http://radioperu.pe/es/artists/#{@artist.slug}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
    system("curl --insecure '#{url}'")
    url = "https://graph.facebook.com/?id=http://radioperu.pe/en/artists/#{@artist.slug}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
    system("curl --insecure '#{url}'")
  end

end