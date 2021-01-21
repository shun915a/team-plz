class CreateFriendTags < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
