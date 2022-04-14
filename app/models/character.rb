class Character < ApplicationRecord
  #ユーザーが消えても投稿は消えないが、投稿が消えたらお気に入りから消える
  belongs_to :user
  has_many :favorites, dependent: :destroy
  #写真がアップできるようになる
  has_one_attached :image
 acts_as_taggable_on :elements #キャラの萌え属性
  #作成順
    default_scope -> { order(created_at: :desc) }

 #存在しないユーザーはお気に入り機能は使えない
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :user_id, presence: true
  #NGワードの設定と存在性・長さについての制約
  validates :chara_name, presence: true, length: { maximum: 100 },
            exclusion: {in: ["馬鹿","阿保","陰険"]}
  validates :appear_in, presence: true, length: { maximum: 380 },
            exclusion: {in: ["馬鹿","阿保","陰険"]}
  #なぜか二つともに制約つけないとエラー。同作品に同姓同名の登録不可
  validates :appear_in,  uniqueness: { scope: :chara_name }
  validates :chara_name, uniqueness: { scope: :appear_in }

end

