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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160615115722) do

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "my_polls", force: :cascade do |t|
    t.string   "admin_id"
    t.string   "mypoll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "my_polls", ["admin_id", "mypoll_id"], name: "index_my_polls_on_admin_id_and_mypoll_id", unique: true
  add_index "my_polls", ["admin_id"], name: "index_my_polls_on_admin_id"
  add_index "my_polls", ["mypoll_id"], name: "index_my_polls_on_mypoll_id"

  create_table "polls", force: :cascade do |t|
    t.text     "topic"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "yes"
    t.integer  "no"
    t.time     "deleted_at"
    t.time     "delete_at"
  end

  add_index "polls", ["user_id", "created_at"], name: "index_polls_on_user_id_and_created_at"
  add_index "polls", ["user_id"], name: "index_polls_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "vote_options", force: :cascade do |t|
    t.string   "title"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vote_options", ["poll_id"], name: "index_vote_options_on_poll_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["poll_id", "user_id"], name: "index_votes_on_poll_id_and_user_id", unique: true
  add_index "votes", ["poll_id"], name: "index_votes_on_poll_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
