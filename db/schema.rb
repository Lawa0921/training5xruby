# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_24_131807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mission_tags", force: :cascade do |t|
    t.bigint "mission_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_mission_tags_on_mission_id"
    t.index ["tag_id"], name: "index_mission_tags_on_tag_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "priority"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["name"], name: "index_missions_on_name"
    t.index ["status"], name: "index_missions_on_status"
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mission_tags", "missions"
  add_foreign_key "mission_tags", "tags"
end
