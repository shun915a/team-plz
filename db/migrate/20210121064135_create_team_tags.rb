class CreateTeamTags < ActiveRecord::Migration[6.0]
  def change
    create_table :team_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
