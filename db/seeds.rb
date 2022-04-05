# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array = %w(キュート ナチュラル エレガント モード レディースマッシュ メンズマッシュ ショートボブ 内巻きボブ ショートレイヤー ロングレイヤー レイヤー レディース刈上げ メンズ刈上げ メンズカット メンズツーブロック レディースツーブロック モヒカン メンズビジネス 女の子 男の子 学生 ミセス バレイヤージュ メッシュ グラデーションカラー 芸能人 編み込み 結婚式 成人式 卒業式 和装 パーティー カジュアル メイクキュート メイクモード メイクナチュラル メイクエレガント メイク成人式 メンズウルフ レディースウルフ グラデーションボブ 外ハネボブ 前下がり スポーティー グレイヘア インナーカラー イヤリングカラー メンズパーマ レディースパーマ メンズメッシュ メンズカラー)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}

