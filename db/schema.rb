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

ActiveRecord::Schema.define(version: 20200625010642) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_likes_on_story_id"
    t.index ["user_id", "story_id"], name: "index_likes_on_user_id_and_story_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.text "start_text"
    t.text "consent_text"
    t.text "terning_text"
    t.text "finish_text"
    t.integer "user_id"
    t.boolean "status", default: true
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0, null: false
    t.index ["user_id", "created_at"], name: "index_stories_on_user_id_and_created_at"
  end

  create_table "story_categories", force: :cascade do |t|
    t.integer "story_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_story_categories_on_category_id"
    t.index ["story_id", "category_id"], name: "index_story_categories_on_story_id_and_category_id", unique: true
    t.index ["story_id"], name: "index_story_categories_on_story_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
