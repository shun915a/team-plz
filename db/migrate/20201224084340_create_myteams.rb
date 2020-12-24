class CreateMyteams < ActiveRecord::Migration[6.0]
  def change
    create_table :myteams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :team_name, null: false
      t.text :team_profile, null: false
      t.timestamps
    end
  end
end
