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

ActiveRecord::Schema.define(version: 2018_07_02_061656) do

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.string "detail"
    t.text "content"
    t.integer "clicks"
    t.string "images"
    t.string "cardtype"
    t.binary "other"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_cards_on_user_id_and_created_at"
    t.index ["user_id", nil, "created_at"], name: "index_cards_on_user_id_and_card_id_and_created_at"
    t.index ["user_id", nil], name: "index_cards_on_user_id_and_discovery_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_comments_on_card_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dcomments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "discovery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discovery_id"], name: "index_dcomments_on_discovery_id"
    t.index ["user_id"], name: "index_dcomments_on_user_id"
  end

  create_table "discoveries", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "dtype"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "gender"
    t.string "phone"
    t.string "email"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
  end

end
