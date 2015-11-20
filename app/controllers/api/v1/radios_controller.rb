class Api::V1::RadiosController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     radio = Radio.find(params[:id])
     render json: radio.to_json, status: 200
   end
 
   def index
     radios = Radio.all
     render json: radios.to_json, status: 200
   end

end