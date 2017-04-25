module Services::Users
  class Oauth < Base
    class Error < ::StandardError; end

    TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/

    attribute :current_user, Object
    attribute :params, Object

    def find_or_create
      identity = ::Oauth.find_for_oauth(params)
      user     = current_user.presence || identity.user

      # if user.nil?
      #
      #   # Get the existing user by email if the provider gives us a verified email.
      #   # If no verified email was provided we assign a temporary email and ask the
      #   # user to verify it on the next step via UsersController.finish_signup
      #   email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      #   email = auth.info.email if email_is_verified
      #   user = User.where(:email => email).first if email
      #
      #   # Create the user if it's a new registration
      #   if user.nil?
      #     user = User.new(
      #       name: auth.extra.raw_info.name,
      #       #username: auth.info.nickname || auth.uid,
      #       email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
      #       password: Devise.friendly_token[0,20]
      #     )
      #     user.skip_confirmation!
      #     user.save!
      #   end
      # end
      #
      # # Associate the identity with the user if needed
      # if identity.user != user
      #   identity.user = user
      #   identity.save!
      # end
      user
    end
  end
end