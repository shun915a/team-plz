class CreateScoutTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :scout_tag_relations do |t|
      t.references :scout, null: false, foreign_key: true
      t.references :scout_tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
