class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :users, null: false, foreign_key: true
      t.references :myteam, null: false, foreign_key: true
      t.string :team_title, null: false
      t.string :team_game_id, null: false
      t.text :team_text, null: false
      t.timestamps
    end
  end
end
