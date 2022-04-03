class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :chara_name
      t.string :appear_in
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
