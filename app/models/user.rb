class User < ApplicationRecord
  acts_as_paranoid
  has_many :characters
  has_many :favorites, dependent: :destroy
  has_many :favorited_characters, through: :favorites, source: :character
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
