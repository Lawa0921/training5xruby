class AddAuthorityColumnToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :authority, :integer, null: false, default: 0
  end
  def down
    remove_column :users, :authority
  end
end
