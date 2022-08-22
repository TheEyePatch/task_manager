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

ActiveRecord::Schema.define(version: 2022_08_22_130300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "outputs", force: :cascade do |t|
    t.bigint "employee_id"
    t.text "remarks_one"
    t.text "remarks_two"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "account", default: "", null: false
    t.string "office_num", null: false
    t.string "first_name", null: false
    t.string "type"
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account"], name: "index_users_on_account", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.bigint "output_id"
    t.integer "work_hrs"
    t.integer "work_num"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["output_id"], name: "index_works_on_output_id"
  end

end
