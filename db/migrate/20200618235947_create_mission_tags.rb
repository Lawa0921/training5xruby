class CreateMissionTags < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_tags do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
