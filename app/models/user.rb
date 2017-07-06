class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :notes
  has_many :likes
  has_many :followers, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, class_name: 'Following', foreign_key: :followee_id

  def followed?(current_user)
    Following.find_by(follower: current_user, followee: self)
  end

  def likes?(note)
    Like.find_by(note: note, user: self)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
