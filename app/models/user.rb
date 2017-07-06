class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes
  has_many :followers, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, class_name: 'Following', foreign_key: :followee_id

end
