class RenameBirtthdayColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :birtthday, :birthday
  end
end
