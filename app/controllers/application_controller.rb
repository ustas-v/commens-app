class ApplicationController < ActionController::Base
  ## Modules, constants

  protect_from_forgery with: :exception

  ## Helpers
  ## Before, after and other filters

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  def configure_permitted_parameters
    added_attrs = [
      :login, :email, :password, :password_confirmation, :remember_me,
      :first_name, :last_name
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private
end
