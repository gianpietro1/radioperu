class Api::V1::AlbumsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
    artist = Artist.where(Artist.arel_table[:name].matches(URI.unescape(params[:artist_name]).downcase)).first
    if artist
      song = artist.songs.where(artist.songs.arel_table[:name].matches(URI.unescape(params[:song_name]).downcase)).first
      if song
        album = song.album
      else
        album = nil
      end
    else
      album = nil
    end

    # Only log if Android
    if request.env['HTTP_USER_AGENT'].downcase.match(/android/)
      MyLog.log.info "Looking for artist " + params[:artist_name] + " with song " + params[:song_name]
    end
    
    render json: album.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end


end

