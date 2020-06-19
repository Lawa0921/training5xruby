class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.time :start_at
      t.time :end_at
      t.integer :order
      t.integer :status

      t.timestamps
    end
  end
end
