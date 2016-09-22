# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "box" , primary_key: "box_id", force: :cascade do |t|
    t.string  "name",        limit: 100, null: false
    t.string  "description", limit: 600, null: false
    t.integer "location_id",             null: false
    t.string  "phone",       limit: 100, null: false
    t.integer "score",                   null: false
    t.binary  "bussy",       limit: 1,   null: false
    t.index ["location_id"], name: "box_location", using: :btree
  end

  create_table "city", primary_key: "city_id", force: :cascade do |t|
    t.string  "city_name",  limit: 128, null: false
    t.integer "country_id",             null: false
    t.index ["country_id"], name: "city_country", using: :btree
  end

  create_table "client", primary_key: "client_id", force: :cascade do |t|
    t.string  "firstName",      limit: 128,   null: false
    t.string  "lastName",       limit: 128,   null: false
    t.string  "companyName",    limit: 128
    t.string  "email",          limit: 128
    t.string  "phone",          limit: 128
    t.date    "birthday"
    t.string  "VAT_ID",         limit: 64
    t.integer "group_id",                     null: false
    t.text    "client_address", limit: 65535, null: false
    t.index ["group_id"], name: "client_tbgroup", using: :btree
  end

  create_table "country", primary_key: "country_id", force: :cascade do |t|
    t.string "country_name", limit: 128, null: false
  end

  create_table "employee", primary_key: "dni", force: :cascade do |t|
    t.string   "userName",         limit: 100
    t.string   "firstName",        limit: 100,                                      null: false
    t.string   "lastName",         limit: 100,                                      null: false
    t.string   "email",            limit: 100,                                      null: false
    t.integer  "group_id",                     default: 0,                          null: false
    t.date     "dateIn",                                                            null: false
    t.date     "dateOut"
    t.string   "password",         limit: 100,                                      null: false
    t.binary   "isValid",          limit: 6
    t.string   "languageIt",       limit: 2,                                        null: false
    t.integer  "validationOrigin", limit: 1,                                        null: false
    t.binary   "isSystemUser",     limit: 6
    t.datetime "time_created",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["group_id"], name: "employee_tbgroup", using: :btree
  end

  create_table "event" , primary_key: "event_id", force: :cascade do |t|
    t.string  "name",        limit: 128,   null: false
    t.text    "description", limit: 65535, null: false
    t.date    "date_event",                null: false
    t.time    "time_event",                null: false
    t.integer "capacity",                  null: false
  end

  create_table "location" , primary_key: "location_id", force: :cascade do |t|
    t.string  "name",        limit: 100, null: false
    t.string  "description", limit: 600, null: false
    t.string  "address",     limit: 400, null: false
    t.string  "phone",       limit: 100, null: false
    t.string  "coordenate",  limit: 50,  null: false
    t.integer "management",              null: false
    t.integer "city_id",                 null: false
    t.index ["city_id"], name: "location_city", using: :btree
  end

  create_table "payment_data" , primary_key: "payment_data_id", force: :cascade do |t|
    t.integer "payment_type_id", null: false
    t.string  "data_name",       null: false
    t.string  "data_type",       null: false
    t.index ["payment_type_id", "data_name"], name: "payment_data_ak_1", unique: true, using: :btree
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer "shipment_id",     null: false
    t.integer "payment_data_id", null: false
    t.string  "value",           null: false
    t.index ["payment_data_id"], name: "payment_details_payment_data", using: :btree
    t.index ["shipment_id"], name: "payment_details_shipment", using: :btree
  end

  create_table "payment_type", force: :cascade, comment: "e.g. card, cash, paypal, wire transfer" do |t|
    t.string "type_name", limit: 64, null: false
  end

  create_table "product" , primary_key: "product_id", force: :cascade do |t|
    t.string  "product_name",        limit: 64,                         null: false
    t.string  "product_description",                                    null: false
    t.integer "product_type_id",                                        null: false
    t.string  "unit",                limit: 16,                         null: false
    t.decimal "price_per_unit",                 precision: 8, scale: 2, null: false
    t.index ["product_type_id"], name: "product_product_type", using: :btree
  end

  create_table "product_type", primary_key: "product_type_id", force: :cascade do |t|
    t.string "type_name", limit: 64, null: false
  end

  create_table "shipment" , primary_key: "shipment_id", force: :cascade do |t|
    t.integer  "client_id",                                                                                   null: false
    t.datetime "time_created",                                           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer  "shipment_type_id",                                                                            null: false
    t.integer  "payment_type_id",                                                                             null: false
    t.text     "shipping_address", limit: 65535,                                                              null: false
    t.text     "billing_address",  limit: 65535,                                                              null: false
    t.decimal  "products_price",                 precision: 8, scale: 2,                                      null: false
    t.decimal  "delivery_cost",                  precision: 8, scale: 2,                                      null: false
    t.decimal  "discount",                       precision: 8, scale: 2,                                      null: false
    t.decimal  "final_price",                    precision: 8, scale: 2,                                      null: false
    t.index ["client_id"], name: "shipment_client", using: :btree
    t.index ["payment_type_id"], name: "shipment_payment_type", using: :btree
    t.index ["shipment_type_id"], name: "shipment_shipment_type", using: :btree
  end

  create_table "shipment_details", force: :cascade do |t|
    t.integer "shipment_id",                            null: false
    t.integer "product_id",                             null: false
    t.decimal "quanitity",      precision: 8, scale: 2, null: false
    t.decimal "price_per_unit", precision: 8, scale: 2, null: false
    t.decimal "price",          precision: 8, scale: 2, null: false
    t.index ["product_id"], name: "shipmet_details_product", using: :btree
    t.index ["shipment_id", "product_id"], name: "shipmet_details_ak_1", unique: true, using: :btree
  end

  create_table "shipment_status", force: :cascade do |t|
    t.integer  "shipment_id",                                                          null: false
    t.integer  "status_catalog_id",                                                    null: false
    t.datetime "status_time",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "notes",             limit: 65535
    t.index ["shipment_id"], name: "shipment_status_shipment", using: :btree
    t.index ["status_catalog_id"], name: "shipment_status_status_catalog", using: :btree
  end

  create_table "shipment_type", primary_key: "shipment_type_id", force: :cascade, comment: "e.g. send after payment, charge after delivery, ..." do |t|
    t.string "type_name", limit: 64, null: false
  end

  create_table "song", primary_key: "song_id", force: :cascade do |t|
    t.string  "name",        limit: 200,   null: false
    t.string  "singer_band", limit: 200,   null: false
    t.text    "description", limit: 65535, null: false
    t.integer "duration",                  null: false
    t.integer "genere_id",                 null: false
    t.integer "code",                      null: false
    t.integer "rate",                      null: false
  end

  create_table "genere", primary_key: "genere_id", force: :cascade do |t|
    t.string  "name",        limit: 200,   null: false
    t.string  "description", limit: 65535, null:false
  end

  create_table "reserve_song", primary_key: "reserver_id",  force: :cascade do |t|
    t.integer  "box_id",                     null: false
    t.integer  "song_id",                    null: false
    t.datetime "create_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer  "state",                      null: false
    t.string   "description", limit: 65535,  null: false
    t.integer  "rate_stage",                 null: false
    t.string   "local_video", limit: 400,    null: false
  end

  create_table "status_catalog", primary_key: "status_catalog_id", force: :cascade, comment: "list of all possible statuses: ordered, paid, delivered" do |t|
    t.string "status_name", null: false
  end

  create_table "stock", primary_key: "product_id", force: :cascade do |t|
    t.decimal  "in_stock",         precision: 8, scale: 2,                                      null: false
    t.datetime "last_update_time",                         default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tbgroup", primary_key: "group_id",force: :cascade do |t|
    t.integer "levelGroup",              null: false
    t.string  "description", limit: 100, null: false
  end

  add_foreign_key "box", "location", column: "location_id", name: "box_location"
  add_foreign_key "city", "country", column: "country_id", name: "city_country"
  add_foreign_key "client", "tbgroup", column: "group_id", name: "client_tbgroup"
  add_foreign_key "employee", "tbgroup", column: "group_id", name: "employee_tbgroup"
  add_foreign_key "location", "city", name: "location_city"
  add_foreign_key "payment_data", "payment_type", name: "payment_data_payment_type"
  add_foreign_key "payment_details", "payment_data", column: "payment_data_id", name: "payment_details_payment_data"
  add_foreign_key "payment_details", "shipment", name: "payment_details_shipment"
  add_foreign_key "product", "product_type", name: "product_product_type"
  add_foreign_key "shipment", "client", name: "shipment_client"
  add_foreign_key "shipment", "payment_type", name: "shipment_payment_type"
  add_foreign_key "shipment", "shipment_type", name: "shipment_shipment_type"
  add_foreign_key "shipment_details", "product", name: "shipmet_details_product"
  add_foreign_key "shipment_details", "shipment", name: "shipmet_details_shipment"
  add_foreign_key "shipment_status", "shipment", name: "shipment_status_shipment"
  add_foreign_key "shipment_status", "status_catalog", name: "shipment_status_status_catalog"
  add_foreign_key "stock", "product", name: "stock_product"
end
