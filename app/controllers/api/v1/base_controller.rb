class Api::V1::BaseController < ApplicationController

   skip_before_action :verify_authenticity_token
 
   rescue_from ActiveRecord::RecordNotFound, with: :not_found
   rescue_from ActionController::ParameterMissing, with: :malformed_request
 
   def authenticate_user
     authenticate_or_request_with_http_token do |token, options|
       @app_user = User.find_by(auth_token: token)
     end
   end
 
   def authorize_user
     unless @app_user && @app_user.admin?
       render json: {error: "Not Authorized", status: 403}, status: 403
     end
   end
 
   def malformed_request
     render json: {error: "The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications.", status: 400}, status: 400
   end
 
   def not_found
     render json: {error: "Record not found", status: 404}, status: 404
   end

   def app_version
     version = 0.1
     render json: {version: version}, status: 200
   end

   def time
     time = Time.now
     render json: {current_time: time}, status: 200
   end

end