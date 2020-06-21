class AddValidationAtDatabase < ActiveRecord::Migration[6.0]
  def up
    drop_table :users
    drop_table :mission_tags
    drop_table :missions
    drop_table :tags

    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.timestamps
    end
    create_table :missions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.integer :order, null: false
      t.integer :status, null: false
      t.timestamps
    end
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
    create_table :mission_tags do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :mission_tags
    drop_table :missions
    drop_table :tags

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :order
      t.integer :status
      t.timestamps
    end
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :mission_tags do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
