class CreateDesks < ActiveRecord::Migration[6.0]
  def change
    create_table :desks do |t|
      t.references :user, null: false, foreign_key: true
      t.text :desk_text, null: false
      t.timestamps
    end
  end
end
