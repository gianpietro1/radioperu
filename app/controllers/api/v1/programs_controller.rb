class Api::V1::ProgramsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def index
     programs = Radio.find(params[:id]).programs
     render json: programs.to_json, status: 200
   end

end