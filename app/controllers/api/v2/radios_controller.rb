class Api::V2::RadiosController < Api::V2::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     radio = Station.find(params[:id])
     render json: radio.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end
 
   def index
     radios = Station.all
     render json: radios.to_json(:except => [ :created_at, :updated_at ]), status: 200
   end

  def add_to_radio_stats
    artist = Artist.where(Artist.arel_table[:name].matches(params[:artist_name].downcase)).first
    song_id = artist.songs.where(artist.songs.arel_table[:name].matches(params[:song_name].downcase)).first.id
    ip_address = params[:ip_address]
    city = params[:city]
    country = params[:country]
    user_agent = params[:platform]
    if current_user
      user_id = current_user.id
    else
      user_id = nil
    end
    stat = RadioPlaystat.create(song_id: song_id, listened_at: Time.now, ip_address: ip_address, platform: user_agent, city: city, country: country, user_id: user_id)
    stat.save!
    render json: "OK".to_json, status: 200
  end

end
