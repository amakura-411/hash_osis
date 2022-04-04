class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :character_id
    add_index :favorites, [:user_id, :character_id], unique: true
  end
end