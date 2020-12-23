class CreateScouts < ActiveRecord::Migration[6.0]
  def change
    create_table :scouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :scout_title, null: false
      t.string :scout_game_id, null: false
      t.text :scout_text, null: false
      t.timestamps
    end
  end
end
