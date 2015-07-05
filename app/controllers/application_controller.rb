class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
      
  before_action :set_locale
 
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  protected
     
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :username]
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end

end
