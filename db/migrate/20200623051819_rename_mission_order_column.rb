class RenameMissionOrderColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :missions, :order, :priority
  end
end
