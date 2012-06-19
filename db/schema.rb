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

ActiveRecord::Schema.define(:version => 20120619130741) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "boards", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.string   "picture"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collect_user_post_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collect_user_post_ships", ["post_id"], :name => "index_collect_user_post_ships_on_post_id"
  add_index "collect_user_post_ships", ["user_id"], :name => "index_collect_user_post_ships_on_user_id"

  create_table "collect_user_share_post_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collect_user_share_post_ships", ["post_id"], :name => "index_collect_user_share_post_ships_on_post_id"
  add_index "collect_user_share_post_ships", ["user_id"], :name => "index_collect_user_share_post_ships_on_user_id"

  create_table "collect_user_topic_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collect_user_topic_ships", ["topic_id"], :name => "index_collect_user_topic_ships_on_topic_id"
  add_index "collect_user_topic_ships", ["user_id"], :name => "index_collect_user_topic_ships_on_user_id"

  create_table "pictures", :force => true do |t|
    t.string   "file"
    t.text     "url"
    t.text     "url_median"
    t.text     "url_thumb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pictures", ["user_id"], :name => "index_pictures_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "picture"
    t.integer  "like_count",   :default => 0
    t.integer  "view_count",   :default => 0
    t.boolean  "index_slider", :default => false
  end

  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "share_posts", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.string   "picture"
    t.integer  "like_count",   :default => 0
    t.integer  "view_count",   :default => 0
    t.boolean  "index_slider", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_posts", ["topic_id"], :name => "index_share_posts_on_topic_id"
  add_index "share_posts", ["user_id"], :name => "index_share_posts_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "topics", :force => true do |t|
    t.integer  "board_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["board_id"], :name => "index_topics_on_board_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "user_references", :force => true do |t|
    t.integer  "target_user_id"
    t.integer  "follower_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_references", ["follower_user_id"], :name => "index_user_references_on_follower_user_id"
  add_index "user_references", ["target_user_id"], :name => "index_user_references_on_target_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "birthday"
    t.boolean  "birthday_setting"
    t.string   "interest"
    t.string   "job"
    t.string   "description"
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
