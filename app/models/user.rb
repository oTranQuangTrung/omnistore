class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :user_shops, dependent: :destroy
  has_many :shops, through: :user_shops

  class << self
    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def from_omniauth(auth)
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email || "#{Devise.friendly_token}@omniauth.com"
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.profile_picture_url = auth.info.image
      end
    end
  end
end
