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

ActiveRecord::Schema.define(version: 20180314015032) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.integer  "user_id"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.binary   "uuid",             limit: 16
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
    t.index ["uuid"], name: "index_addresses_on_uuid", unique: true, using: :btree
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.string   "month"
    t.string   "year"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "purchaser_id"
    t.binary   "uuid",         limit: 16
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["purchaser_id"], name: "index_credit_cards_on_purchaser_id", using: :btree
    t.index ["uuid"], name: "index_credit_cards_on_uuid", unique: true, using: :btree
  end

  create_table "descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",              limit: 65535
    t.string   "descriptionable_type"
    t.integer  "descriptionable_id"
    t.binary   "uuid",                 limit: 16
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["descriptionable_type", "descriptionable_id"], name: "index_description_on_descriptionable_type_and_descriptionable_id", using: :btree
    t.index ["uuid"], name: "index_descriptions_on_uuid", unique: true, using: :btree
  end

  create_table "food_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "price",                         precision: 16, scale: 2
    t.string   "food_itemable_type"
    t.integer  "food_itemable_id"
    t.string   "image_url"
    t.string   "type"
    t.binary   "uuid",               limit: 16
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["food_itemable_type", "food_itemable_id"], name: "index_food_items_on_food_itemable_type_and_food_itemable_id", using: :btree
    t.index ["uuid"], name: "index_food_items_on_uuid", unique: true, using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchaser_id"
    t.integer  "restaurant_id"
    t.binary   "uuid",          limit: 16
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["purchaser_id"], name: "index_orders_on_purchaser_id", using: :btree
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree
    t.index ["uuid"], name: "index_orders_on_uuid", unique: true, using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "credit_card_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["credit_card_id"], name: "index_payments_on_credit_card_id", using: :btree
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "food_type"
    t.binary   "uuid",       limit: 16
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["uuid"], name: "index_restaurants_on_uuid", unique: true, using: :btree
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "monday_opens_at"
    t.datetime "monday_closes_at"
    t.datetime "tuesday_opens_at"
    t.datetime "tuesday_closes_at"
    t.datetime "wednesday_opens_at"
    t.datetime "wednesday_closes_at"
    t.datetime "thursday_opens_at"
    t.datetime "thursday_closes_at"
    t.datetime "friday_opens_at"
    t.datetime "friday_closes_at"
    t.datetime "saturday_opens_at"
    t.datetime "saturday_closes_at"
    t.datetime "sunday_opens_at"
    t.datetime "sunday_closes_at"
    t.integer  "restaurant_id"
    t.binary   "uuid",                limit: 16
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["restaurant_id"], name: "index_schedules_on_restaurant_id", using: :btree
    t.index ["uuid"], name: "index_schedules_on_uuid", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                             default: "",          null: false
    t.string   "encrypted_password",                default: "",          null: false
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,           null: false
    t.integer  "api_sign_in_count",                 default: 0,           null: false
    t.integer  "order_count",                       default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,           null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "type",                              default: "Purchaser"
    t.binary   "uuid",                   limit: 16
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "credit_cards", "users", column: "purchaser_id"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users", column: "purchaser_id"
  add_foreign_key "payments", "credit_cards"
  add_foreign_key "payments", "orders"
  add_foreign_key "schedules", "restaurants"
end
