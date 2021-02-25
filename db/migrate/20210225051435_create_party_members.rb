class CreatePartyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :party_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
