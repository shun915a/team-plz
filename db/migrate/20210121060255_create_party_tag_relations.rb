class CreatePartyTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :party_tag_relations do |t|
      t.references :party, null: false, foreign_key: true
      t.references :party_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
