class AlbumsController < ApplicationController

  respond_to :html, :js

  def show
    @artist = Artist.friendly.find(params[:artist_id])  
    @album = @artist.albums.friendly.find(params[:id])
    authorize @album
    @songs = @album.songs.all
    @comments = @album.comments.roots
    @commentable = @album
    @pageviews = @album.views
    if @artist.social_fb
      @facebook_id = @artist.social_fb[/.*\/(.*)/,1]
    end
    @albums_array = []
    @artist.albums.each do |album| 
      @albums_array << album.id
    end
  end

  def album_summary
    @artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first
    if @artist
      @song = @artist.songs.where(@artist.songs.arel_table[:name].matches(params[:song_name].downcase)).first
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
    @artist = Artist.friendly.find(params[:artist_id])
    @album = Album.new  
    authorize @album
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.build(album_params)
    @album.user_id = @artist.user_id
    authorize @album
    if @album.save
      @album.update_attributes(user_id: @artist.user_id)
      @album.send_update_email
      update_facebook_graph
      if @album.genre_id == nil
        @album.genre_id = @artist.genre_id
      end
      flash[:notice] = t(:album_saved)
      redirect_to [@artist,@album]      
    else
      flash[:error] = t(:album_create_error)
      render :new
    end    
  end

  def edit
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.friendly.find(params[:id])
    authorize @album
  end

  def update
    @artist = Artist.friendly.find(params[:artist_id])  
    @album = @artist.albums.friendly.find(params[:id])
    authorize @album
    if @album.update_attributes(album_params)      
      @album.send_update_email
      update_facebook_graph
      flash[:notice] = t(:album_updated)
      redirect_to ("/#{I18n.locale.to_s}/" + @artist.slug + '/albums/' + @album.slug)
    else
      flash[:error] = t(:album_update_error)
      render :edit
    end    
  end

  def destroy
   @artist = Artist.friendly.find(params[:artist_id])  
   @album = @artist.albums.friendly.find(params[:id])
   authorize @album
   name = @album.name
    if @album.destroy
      flash[:notice] = t(:album_destroyed)
      redirect_to @artist
    else
      flash[:error] = t(:album_destroy_error)
      render :show
    end
  end

  def sound_offset
    respond_with() do |format|
      format.html {render :partial => "sound_offset" }
    end
  end

  def add_to_album_stats
    song_id = params[:song_played_id].to_i
    ip_address = params[:ip_address]
    country = params[:country]
    city = params[:city]
    user_agent = params[:platform]
    if current_user
      user_id = current_user.id
    else
      user_id = nil
    end
    stat = AlbumPlaystat.create(song_id: song_id, listened_at: Time.now, ip_address: ip_address, platform: user_agent, user_id: user_id, country: country, city: city)
    stat.save!
    respond_with() do |format|
      format.html {render :partial => "add_to_album_stats" }
    end
  end

  def add_to_album_views
    album_id = params[:album_id].to_i
    ip_address = params[:ip_address]
    country = params[:country]
    city = params[:city]
    user_agent = params[:platform]
    if current_user
      user_id = current_user.id
    else
      user_id = nil
    end
    stat = AlbumViewstat.create(album_id: album_id, viewed_at: Time.now, ip_address: ip_address, platform: user_agent, user_id: user_id, country: country, city: city)
    stat.save!
    respond_with() do |format|
      format.html {render :partial => "add_to_album_views" }
    end
  end

  private

    def album_params
      params.require(:album).permit(:name, :year, :cover, :review, :format_id, :genre_id, :buylink, songs_attributes: [ :id, :discnum, :track, :name, :filename, :id3, :_destroy ] )
    end

    def update_facebook_graph
      url = "https://graph.facebook.com/?id=http://radioperu.pe/es/artists/#{@artist.slug}/albums/#{@album.slug}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
      system("curl -X POST --insecure '#{url}'")
    end

end