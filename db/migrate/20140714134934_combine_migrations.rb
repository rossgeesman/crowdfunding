class CombineMigrations < ActiveRecord::Migration

def change

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "collaborators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "name_en"
    t.string   "name_kr"
    t.text     "bio_en"
    t.text     "bio_kr"
  end

  create_table "customers", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "images", force: true do |t|
    t.integer "product_id"
    t.string  "image_url"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.datetime "created_at"
    t.string   "trait_name"
    t.integer  "product_id"
    t.string   "recipient"
    t.string   "address_field_1"
    t.string   "address_field_2"
    t.string   "postal_code"
    t.string   "phone_number"
    t.boolean  "paid",            default: false
  end

  create_table "products", force: true do |t|
    t.string   "image_url"
    t.integer  "minbuy"
    t.integer  "line_items_count", default: 0, null: false
    t.integer  "collaborator_id"
    t.datetime "end_date"
    t.string   "title_kr"
    t.string   "title_en"
    t.text     "description_kr"
    t.text     "description_en"
    t.integer  "price"
  end

  create_table "products_traits", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "trait_id"
  end

  add_index "products_traits", ["product_id", "trait_id"], name: "index_products_traits_on_product_id_and_trait_id"

  create_table "traits", force: true do |t|
    t.string "trait_name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
end