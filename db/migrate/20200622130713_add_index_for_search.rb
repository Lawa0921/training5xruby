class AddIndexForSearch < ActiveRecord::Migration[6.0]
  def up
    change_table :missions do |t|
      t.index :name
      t.index :status
    end
  end

  def down
    remove_index :missions, name: "index_missions_on_name"
    remove_index :missions, name: "index_missions_on_status" 
  end
end
