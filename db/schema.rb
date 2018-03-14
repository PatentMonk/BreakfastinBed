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

ActiveRecord::Schema.define(version: 20180301020756) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.integer  "user_id"
    t.string   "uuid",        default: "UUID()"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.string   "month"
    t.string   "year"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "address_id"
    t.integer  "purchaser_id"
    t.string   "uuid",         default: "UUID()"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "words",           limit: 65535
    t.integer  "connection_id"
    t.string   "connection_type"
    t.string   "uuid",                          default: "UUID()"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "food_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "price",          precision: 10
    t.integer  "description_id"
    t.string   "image_url"
    t.string   "uuid",                          default: "UUID()"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchaser_id"
    t.integer  "restaurant_id"
    t.integer  "payment_id"
    t.string   "uuid",          default: "UUID()"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "address_id"
    t.string   "food_type"
    t.string   "uuid",       default: "UUID()"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
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
    t.string   "uuid",                default: "UUID()"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.integer  "api_sign_in_count",      default: 0,           null: false
    t.integer  "order_count",            default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,           null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "type",                   default: "Purchaser"
    t.string   "uuid",                   default: "UUID()"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
