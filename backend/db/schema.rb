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

ActiveRecord::Schema[7.1].define(version: 2023_11_14_150524) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "survivor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_inventories_on_survivor_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_inventories", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "inventory_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_items_inventories_on_inventory_id"
    t.index ["item_id"], name: "index_items_inventories_on_item_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.bigint "survivor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_locations_on_survivor_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.boolean "is_alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventories", "survivors"
  add_foreign_key "items_inventories", "inventories"
  add_foreign_key "items_inventories", "items"
  add_foreign_key "locations", "survivors"
end
