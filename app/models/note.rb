class Note < ApplicationRecord

  belongs_to :user

  validates :body, presence: true
# dependent: destroy likes
end
