class CreateFriendTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_tag_relations do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :friend_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
