class PlaylistsController < ApplicationController

  respond_to :html, :js

  def index
    if current_user
      @user_playlists = current_user.playlists
      @playlists = Playlist.where(private: false) - @user_playlists
    else
      @playlists = Playlist.where(private: false)
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end

  def new
    @playlist = Playlist.new
    authorize @playlist
  end

  def create
    @playlist = current_user.playlists.create(playlist_params)
    authorize @playlist
    if @playlist.save
      flash[:notice] = t(:playlist_saved)
      update_facebook_graph
      redirect_to @playlist
    else
      flash[:error] = t(:playlist_create_error)
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end

  def update
    @playlist = Playlist.find(params[:id])
    authorize @playlist
    if @playlist.update_attributes(playlist_params)
      flash[:notice] = t(:playlist_updated)
      update_facebook_graph
      redirect_to @playlist
    else
      flash[:error] = t(:playlist_update_error)
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    authorize @playlist
    if @playlist.destroy
      flash[:notice] = t(:playlist_destroyed)
      redirect_to playlists_path
    else
      flash[:error] = t(:playlist_destroy_error)
      render :show
    end
  end

  def sound_offset_pl
    respond_with() do |format|
      format.html {render :partial => "sound_offset_pl" }
    end
  end

  def add_to_playlist
    @song = Song.find(params[:song_id])
    @playlist = current_user.playlists.first
    respond_with(@song,@playlist) do |format|
      format.html {render :partial => "add_to_playlist" }
    end
  end

  def remove_from_playlist
    @song = Song.find(params[:song_id])
    @playlist = current_user.playlists.first
    respond_with(@song,@playlist) do |format|
      format.html {render :partial => "remove_from_playlist" }
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name, :description, :image, :private)
    end

    def update_facebook_graph
      url = "https://graph.facebook.com/?id=http://radioperu.pe/es/playlists/#{@playlist.id}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
      system("curl -X POST --insecure '#{url}'")
    end

end