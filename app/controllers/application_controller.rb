class ApplicationController < ActionController::Base

  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?
       
  rescue_from Pundit::NotAuthorizedError do |exception|
   redirect_to root_url, alert: t(:operation_not_authorized)
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def default_url_options(options = {})
   { locale: I18n.locale }.merge options
  end

  protected
     
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :username]
    devise_parameter_sanitizer.for(:account_update) << [:name, :username]
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end

end
