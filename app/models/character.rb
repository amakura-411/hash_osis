class Character < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  acts_as_taggable_on :elements #キャラの萌え属性
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  #　100文字以上は通称を書いてもらうように注意書き
  validates :chara_name, presence: true, length: { maximum: 100 }
  # 380＝世界一長い作品のタイトルの文字数+5文字
  validates :appear_in, presence: true, length: { maximum: 380 }
  
  validates :appear_in,  uniqueness: { scope: :chara_name }
  validates :chara_name, uniqueness: { scope: :appear_in }

end

