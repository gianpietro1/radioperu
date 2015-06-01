class SongsController < ApplicationController
 
  def show
    @song = Song.find(params[:id])
    @album = Album.find(params[:album_id])
    @artist = Artist.find(params[:artist_id])
    path = @song.filename.to_s
    @id3tags = Id3Tags.read_tags_from("#{Rails.root}/public/#{path}")
  end

  def edit
    @song = Song.find(params[:id])
    @album = Album.find(params[:album_id])
    @artist = Artist.find(params[:artist_id])
  end

  def update
    @song = Song.find(params[:id])
    @album = Album.find(params[:album_id])
    @artist = Artist.find(params[:artist_id])
    if @song.update_attributes(song_params)
      flash[:notice] = t(:song_updated)
      redirect_to [@artist,@album,@song]
    else
      flash[:error] = t(:song_update_error)
      render :edit
    end    
  end

  private

  def song_params
    params.require(:song).permit(:discnum, :track, :name, :review, :filename, :length, :video, :lyrics)
  end

end
