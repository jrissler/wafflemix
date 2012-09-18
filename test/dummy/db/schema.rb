# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120915192514) do

  create_table "wafflemix_assets", :force => true do |t|
    t.string   "asset_uid"
    t.string   "asset_mime_type"
    t.integer  "asset_file_size"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "wafflemix_page_translations", :force => true do |t|
    t.integer  "wafflemix_page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "wafflemix_page_translations", ["locale"], :name => "index_wafflemix_page_translations_on_locale"
  add_index "wafflemix_page_translations", ["wafflemix_page_id"], :name => "index_d726c55d32afe225f4f593cd5049b918f4a395ff"

  create_table "wafflemix_pages", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position"
    t.boolean  "show_in_menu"
    t.string   "link_url"
    t.boolean  "deletable"
    t.boolean  "draft"
    t.boolean  "skip_to_first"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "ancestry"
  end

  add_index "wafflemix_pages", ["ancestry"], :name => "index_wafflemix_pages_on_ancestry"

  create_table "wafflemix_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wafflemix_user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wafflemix_user_roles", ["role_id"], :name => "index_wafflemix_user_roles_on_role_id"
  add_index "wafflemix_user_roles", ["user_id"], :name => "index_wafflemix_user_roles_on_user_id"

  create_table "wafflemix_users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "wafflemix_users", ["email"], :name => "index_wafflemix_users_on_email", :unique => true
  add_index "wafflemix_users", ["reset_password_token"], :name => "index_wafflemix_users_on_reset_password_token", :unique => true
  add_index "wafflemix_users", ["username"], :name => "index_wafflemix_users_on_username", :unique => true

end
