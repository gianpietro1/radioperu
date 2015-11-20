class Api::V1::AlbumsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
    artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first
    if artist
      song = artist.songs.where(artist.songs.arel_table[:name].matches(params[:song_name].downcase)).first
      if song
        album = song.album
      else
        album = nil
      end
    else
      album = nil
    end

    render json: album.to_json, status: 200
   end


end

