class PlaylistsController < ApplicationController

  respond_to :html, :js

  def index
    @user_playlists = current_user.playlists
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.create(playlist_params)
    if @playlist.save
      flash[:notice] = t(:playlist_saved)
      redirect_to playlists_path
    else
      flash[:error] = t(:playlist_create_error)
      render :new
    end
  end

  def edit
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
      params.require(:playlist).permit(:name)
    end

end