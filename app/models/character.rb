class Character < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  #　100文字以上は通称を書いてもらうように注意書き
  validates :chara_name, presence: true, length: { maximum: 100 }
  # 380＝世界一長い作品のタイトルの文字数+5文字
  validates :appear_in, presence: true, length: { maximum: 380 }
end
