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

ActiveRecord::Schema.define(version: 20180507013552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "products_id"
    t.index ["products_id"], name: "index_carts_on_products_id"
    t.index ["users_id"], name: "index_carts_on_users_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "item_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 15, scale: 2
    t.integer "quantity"
    t.decimal "total_price", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 15, scale: 2
    t.decimal "shipping", precision: 15, scale: 2
    t.decimal "total", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_status_id"
    t.string "payment_no"
    t.bigint "user_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "availability", null: false
    t.decimal "price", precision: 15, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "picture"
    t.text "maps"
    t.bigint "stores_id"
    t.bigint "categories_id"
    t.boolean "active"
    t.index ["categories_id"], name: "index_products_on_categories_id"
    t.index ["stores_id"], name: "index_products_on_stores_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "products_id"
    t.bigint "users_id"
    t.bigint "stores_id"
    t.string "title"
    t.string "buyer"
    t.bigint "order_id"
    t.string "status"
    t.index ["order_id"], name: "index_transactions_on_order_id"
    t.index ["products_id"], name: "index_transactions_on_products_id"
    t.index ["stores_id"], name: "index_transactions_on_stores_id"
    t.index ["users_id"], name: "index_transactions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.text "address1"
    t.text "address2"
    t.string "suburb"
    t.string "state"
    t.string "phone"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zip"
    t.string "city"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.bigint "stores_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["stores_id"], name: "index_users_on_stores_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "carts", "products", column: "products_id"
  add_foreign_key "carts", "users", column: "users_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "pictures", "products"
  add_foreign_key "products", "categories", column: "categories_id"
  add_foreign_key "products", "stores", column: "stores_id"
  add_foreign_key "transactions", "orders"
  add_foreign_key "transactions", "products", column: "products_id"
  add_foreign_key "transactions", "stores", column: "stores_id"
  add_foreign_key "transactions", "users", column: "users_id"
  add_foreign_key "users", "stores", column: "stores_id"
end
