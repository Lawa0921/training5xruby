class ReaddColumnValidation < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :name, :string, unique: true, null: false
    change_column :users, :email, :string, unique: true, null: false

    change_column :missions, :name, :string, null: false
    change_column :missions, :start_at, :datetime, null: false
    change_column :missions, :priority, 'integer USING CAST(priority AS integer)', null: false
    change_column :missions, :status,  'integer USING CAST(status AS integer)', null: false
    
    change_column :tags, :name, :string, null: false
  end

  def down
    change_column :users, :name, :string, unique: false, null: true
    change_column :users, :email, :string, unique: false, null: true

    change_column :missions, :name, :string, null: true
    change_column :missions, :start_at, :datetime, null: true
    change_column :missions, :priority, 'integer USING CAST(priority AS integer)', null: true
    change_column :missions, :status, 'integer USING CAST(status AS integer)', null: true
    
    change_column :tags, :name, :string, null: true
  end
end
