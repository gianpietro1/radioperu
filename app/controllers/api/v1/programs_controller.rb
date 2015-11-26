class Api::V1::ProgramsController < Api::V1::BaseController

   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
    program = Radio.find(params[:id]).program_active
     render json: program.to_json, status: 200
   end    

   def index
     programs = Radio.find(params[:id]).programs
     render json: programs.to_json, status: 200
   end

end