class CreateTeamTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :team_tag_relations do |t|
      t.references :team, null: false, foreign_key: true
      t.references :team_tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
