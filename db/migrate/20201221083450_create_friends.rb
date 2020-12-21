class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: true
      t.string :friend_title, null: false
      t.string :friend_game_id, null: false
      t.text :friend_text, null: false
      t.timestamps
    end
  end
end
