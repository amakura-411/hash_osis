class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :chara_name, null:false
      t.string :appear_in, null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
      add_index :characters, [:user_id, :created_at]
  end
end
