class CreateScoutTags < ActiveRecord::Migration[6.0]
  def change
    create_table :scout_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
