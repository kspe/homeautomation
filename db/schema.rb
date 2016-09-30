# encoding: UTF-8

ActiveRecord::Schema.define(version: 20160930084048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "control_items", force: :cascade do |t|
    t.string   "kind"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "device_type_id"
  end

  add_index "control_items", ["device_type_id"], name: "index_control_items_on_device_type_id", using: :btree

  create_table "controls", force: :cascade do |t|
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_types", force: :cascade do |t|
    t.string   "name"
    t.string   "api"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "control_items", "device_types"
end
