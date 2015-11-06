class SongsController < ApplicationController
 
  def show
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    @songs = @album.songs
    unless @song.video == nil || @song.video == ''
      @video_id = VideoInfo.new(@song.video).video_id
    end
    authorize @song
  end

  def edit
    @artist = Artist.friendly.find(params[:artist_id])   
    @album = @artist.albums.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    authorize @song
  end

  def update
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    authorize @song
    if @song.update_attributes(song_params)
      if @song.genre == nil
        @song.genre = @album.genre
      end
      flash[:notice] = t(:song_updated)
      begin
        @video_id = VideoInfo.new(@song.video).video_id
      rescue
        @song.update_attributes(video: nil)
      end
      @song.send_update_email
      update_facebook_graph
      redirect_to [@artist,@album,@song]
    else
      flash[:error] = t(:song_update_error)
      render :edit
    end    
  end

  def destroy
   @artist = Artist.friendly.find(params[:artist_id])
   @album = @artist.albums.friendly.find(params[:album_id])
   @song = @album.songs.friendly.find(params[:id])
   authorize @song
   name = @song.name
    if @song.destroy
      flash[:notice] = t(:song_destroyed)
      redirect_to [@artist,@album]
    else
      flash[:error] = t(:song_destroy_error)
      render :show
    end
  end


  private

  def song_params
    params.require(:song).permit(:discnum, :track, :name, :review, :filename, :id3, :video, :lyrics, :genre_id)
  end

  def update_facebook_graph
    url = "https://graph.facebook.com/?id=http://radioperu.pe/es/#{@artist.slug}/albums/#{@album.slug}/songs/#{@song.slug}&scrape=true&access_token=440598459358292|GVj1kcc9QwokzIRBDoNAkznYhQM"
    system("curl -X POST --insecure '#{url}'")
  end

end
