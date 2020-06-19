class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :order
      t.integer :status

      t.timestamps
    end
  end
end
