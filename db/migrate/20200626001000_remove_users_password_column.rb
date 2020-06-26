class RemoveUsersPasswordColumn < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :password
  end
  def down
    add_column :users, :password, :string, null: false
  end
end
