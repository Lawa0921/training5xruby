class AddReferencesToMission < ActiveRecord::Migration[6.0]
  def change
    add_reference :missions, :user, index: true, null: false
  end
end
