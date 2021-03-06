class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :party_title, null: false
      t.string :party_game_id, null: false
      t.text :party_text, null: false
      t.timestamps
    end
  end
end
