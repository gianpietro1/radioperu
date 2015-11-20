class Api::V1::ArtistsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first
     render json: artist.to_json, status: 200
   end
 
   def index
     artists = Artist.all
     render json: artists.to_json, status: 200
   end

end