class Api::V1::ArtistsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
    artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first

    # Pending: only log if Android / iPhone
    MyLog.log.info "Searching artist: " + params[:artist_name]

    self.request.env.each do |header|
      MyLog.log.warn "HEADER KEY: #{header[0]}"
      MyLog.log.warn "HEADER VAL: #{header[1]}"
    end

    render json: artist.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end
 
   def index
     artists = Artist.all
     render json: artists.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end

end