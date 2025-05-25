# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_23_070648) do
  create_table "menus", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "image_url"
    t.boolean "is_available_today", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "menu_id", null: false
    t.string "menu_name", null: false
    t.integer "menu_price", null: false
    t.boolean "is_completed", default: false, null: false
    t.datetime "ordered_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_orders_on_student_id"
  end

  add_foreign_key "orders", "menus"
end
