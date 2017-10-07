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

ActiveRecord::Schema.define(version: 20171007110823) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "name"], name: "index_categories_on_shop_id_and_name", unique: true
    t.index ["shop_id"], name: "index_categories_on_shop_id"
  end

  create_table "collection_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_products_on_collection_id"
    t.index ["product_id", "collection_id"], name: "index_collection_products_on_product_id_and_collection_id", unique: true
    t.index ["product_id"], name: "index_collection_products_on_product_id"
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name"
    t.text "description"
    t.string "featured_image"
    t.boolean "public", default: true
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_collections_on_shop_id"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "profile_picture_url"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "facebook_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "province_id"
    t.index ["facebook_id", "shop_id"], name: "index_customers_on_facebook_id_and_shop_id", unique: true
    t.index ["id", "province_id"], name: "index_customers_on_id_and_province_id", unique: true
  end

  create_table "districts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "facebook_pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "access_token"
    t.string "category"
    t.string "name"
    t.string "fid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_facebook_pages_on_user_id"
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "name"], name: "index_options_on_shop_id_and_name", unique: true
    t.index ["shop_id"], name: "index_options_on_shop_id"
  end

  create_table "product_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "option_id"
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_product_options_on_option_id"
    t.index ["product_id", "option_id", "value"], name: "index_product_options_with_value", unique: true
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "tag_id"], name: "index_product_tags_on_product_id_and_tag_id", unique: true
    t.index ["product_id"], name: "index_product_tags_on_product_id"
    t.index ["tag_id"], name: "index_product_tags_on_tag_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.text "description"
    t.bigint "category_id"
    t.bigint "vendor_id"
    t.float "price", limit: 24
    t.string "sku"
    t.string "barcode"
    t.integer "inventory", default: 0
    t.integer "quantity", default: 0
    t.float "weight", limit: 24, default: 0.0
    t.boolean "shipping", default: true
    t.integer "visibility", default: 0
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "provinces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facebook_page_id"
    t.index ["facebook_page_id"], name: "index_shops_on_facebook_page_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "name"], name: "index_tags_on_shop_id_and_name", unique: true
    t.index ["shop_id"], name: "index_tags_on_shop_id"
  end

  create_table "user_shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_user_shops_on_shop_id"
    t.index ["user_id"], name: "index_user_shops_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.text "profile_picture_url"
    t.string "facebook_access_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "name", null: false
    t.float "price", limit: 24
    t.string "sku"
    t.string "barcode"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "name"], name: "index_variants_on_product_id_and_name", unique: true
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "name"], name: "index_vendors_on_shop_id_and_name", unique: true
    t.index ["shop_id"], name: "index_vendors_on_shop_id"
  end

  add_foreign_key "categories", "shops"
  add_foreign_key "collection_products", "collections"
  add_foreign_key "collection_products", "products"
  add_foreign_key "collections", "shops"
  add_foreign_key "districts", "provinces"
  add_foreign_key "facebook_pages", "users"
  add_foreign_key "options", "shops"
  add_foreign_key "product_options", "options"
  add_foreign_key "product_options", "products"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "shops"
  add_foreign_key "products", "vendors"
  add_foreign_key "shops", "facebook_pages"
  add_foreign_key "tags", "shops"
  add_foreign_key "user_shops", "shops"
  add_foreign_key "user_shops", "users"
  add_foreign_key "variants", "products"
  add_foreign_key "vendors", "shops"
end
