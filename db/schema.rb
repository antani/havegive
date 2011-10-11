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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110818105859) do

  create_table "actors", :force => true do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gives", :force => true do |t|
    t.integer  "user_id"
    t.string   "give_category"
    t.string   "give_place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "give_string"
  end

  create_table "has", :force => true do |t|
    t.integer  "user_id"
    t.string   "has_string"
    t.string   "has_category"
    t.string   "has_place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "haves", :force => true do |t|
    t.integer  "user_id"
    t.string   "have_category"
    t.string   "have_place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "have_string"
  end

  create_table "login_accounts", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.string   "remote_account_id"
    t.string   "name"
    t.string   "login"
    t.string   "picture_url"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "login_accounts", ["type"], :name => "index_login_accounts_on_type"
  add_index "login_accounts", ["user_id"], :name => "index_login_accounts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wants", :force => true do |t|
    t.integer  "user_id"
    t.string   "want_string"
    t.string   "want_category"
    t.string   "want_place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
