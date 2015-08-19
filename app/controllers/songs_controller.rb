class SongsController < ApplicationController
 
  def show
    @album = Album.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    @songs = @album.songs
    authorize @song
    @artist = @album.artist
    begin
     @video_id = VideoInfo.new(@song.video).video_id
    rescue
     @song.update_attributes(video: nil)
    end  
  end

  def edit
    @album = Album.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    authorize @song
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def update
    @album = Album.friendly.find(params[:album_id])
    @song = @album.songs.friendly.find(params[:id])
    authorize @song
    @artist = Artist.friendly.find(params[:artist_id])
    if @song.update_attributes(song_params)
      if @song.genre == nil
        @song.genre = @album.genre
      end
      flash[:notice] = t(:song_updated)
      redirect_to [@artist,@album,@song]
    else
      flash[:error] = t(:song_update_error)
      render :edit
    end    
  end

  def destroy
   @album = Album.friendly.find(params[:album_id])
   @song = @album.songs.friendly.find(params[:id])
   authorize @song
   @artist = @album.artist
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

end
