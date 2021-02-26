class AddColumnPartyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :party_members, :status, :integer, default: 0
  end
end
