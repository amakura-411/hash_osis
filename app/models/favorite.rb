class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :user_id, presence: true
  validates :character_id, presence: true
  validates :user_id, uniqueness: { scope: :character_id }
end
