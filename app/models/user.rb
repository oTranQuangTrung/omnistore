class User < ApplicationRecord
  include User::Ownable

  devise :database_authenticatable, :registerable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :user_shops, dependent: :destroy
  has_many :shops, through: :user_shops
  has_many :facebook_pages

  class << self
    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def from_omniauth(auth)
      user = find_or_initialize_by provider: auth.provider, uid: auth.uid
      user.update_attributes(
        facebook_access_token: auth["credentials"]["token"],
        email: auth.info.email || "#{Devise.friendly_token}@omniauth.com",
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        profile_picture_url: auth.info.image
      )
      return user
    end
  end
end
