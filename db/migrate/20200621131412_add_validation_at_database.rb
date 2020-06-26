class AddValidationAtDatabase < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :name, null: false
    change_column_null :users, :email, null: false
    change_column_null :users, :password, :string, null: false
    change_column :users, :name, :string, unique: true
    change_column :users, :email, :string, unique: true

    change_column_null :missions, :name, null: false
    change_column_null :missions, :start_at, null: false
    change_column_null :missions, :order, null: false
    change_column_null :missions, :status, null: false

    change_column_null :tags, :name, null: false
  end

  def down
    change_column_null :users, :name, null: true
    change_column_null :users, :email, null: true
    change_column_null :users, :password, :string, null: true
    change_column :users, :name, :string, unique: false
    change_column :users, :email, :string, unique: false

    change_column_null :missions, :name, null: true
    change_column_null :missions, :start_at, null: true
    change_column_null :missions, :order, null: true
    change_column_null :missions, :status, null: true

    change_column_null :tags, :name, null: true
  end
end
