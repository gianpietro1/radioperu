class Api::V1::ArtistsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first

    # Only log if iPhone
    if request.env['HTTP_USER_AGENT'].downcase.match(/iphone/)
      MyLog.log.info "Looking for artist " + params[:artist_name]
    end

    render json: artist.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end
 
   def index
     artists = Artist.all
     render json: artists.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end

end