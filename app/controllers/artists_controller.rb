class ArtistsController < ApplicationController

  respond_to :html, :js

  def index
    @artists = Artist.all
    authorize @artists
    @catalogue = "general" 
  end

  def index_station
    @radio = Radio.find_by_id(params[:station_id])
    @artists = @radio.artists
    @catalogue = "station" 
  end

  def show
    @artist = Artist.friendly.find(params[:id])
    authorize @artist
    @albums = @artist.albums
    @songs = @artist.songs
    @catalogue = params[:catalogue] 
    if @artist.social_fb
      @facebook_id = @artist.social_fb[/.*\/(.*)/,1]
    end
    rescue ActiveRecord::RecordNotFound  
      redirect_to :root
      
  end

  def artist_summary
    @artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first
    respond_with(@artist) do |format|
    format.html {render :partial => "artist_summary" }
  end
  
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def create
    @artist = current_user.artists.build(artist_params)
    authorize @artist
    if @artist.save
      flash[:notice] = t(:artist_saved)
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

  def add_to_artist_views
    artist_id = params[:artist_id].to_i
    ip_address = params[:ip_address]
    country = params[:country]
    city = params[:city]
    user_agent = params[:platform]
    if current_user
      user_id = current_user.id
    else
      user_id = nil
    end
    stat = ArtistViewstat.create(artist_id: artist_id, viewed_at: Time.now, ip_address: ip_address, platform: user_agent, user_id: user_id, country: country, city: city)
    stat.save!
    respond_with() do |format|
      format.html {render :partial => "add_to_artist_views" }
    end
  end

private

  def artist_params
    params.require(:artist).permit(:name, :city, :external_url, :social_fb, :active, :bio, :image, :genre_id)
  end

  def update_facebook_graph
    url = "https://graph.facebook.com/?id=http://radioperu.pe/es/artists/#{@artist.slug}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
    system("curl -X POST --insecure '#{url}'")
  end

end