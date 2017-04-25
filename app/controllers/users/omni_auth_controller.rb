class Users::OmniAuthController < Devise::OmniauthCallbacksController
  ## Modules, constants
  ## Helpers

  def self.provides_callback_for(provider)
    class_eval %(
      def #{provider}
        omni_authenticate
      end
    )
  end

  Oauth::TYPES.values.each do |provider|
    provides_callback_for provider
  end

  ## Before, after and other filters
  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def omni_authenticate
    # @user = User.find_for_oauth(env['omniauth.auth'], current_user)
    @user = Services::Users::Oauth.new(
      current_user: current_user, params: env['omniauth.auth']
    ).find_or_create!

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
