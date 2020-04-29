# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_27_130535) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dinner_tags", force: :cascade do |t|
    t.integer "dinner_id"
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dinner_id"], name: "index_dinner_tags_on_dinner_id"
    t.index ["tag_id"], name: "index_dinner_tags_on_tag_id"
  end

  create_table "dinners", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "last_had"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_dinners_on_user_id"
  end

  create_table "loves", force: :cascade do |t|
    t.integer "dinner_id", null: false
    t.integer "user_id", null: false
    t.index ["dinner_id"], name: "index_loves_on_dinner_id"
    t.index ["user_id"], name: "index_loves_on_user_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "weekof"
    t.string "meals"
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "dinner_id"
    t.integer "meal_plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dinner_id"], name: "index_meals_on_dinner_id"
    t.index ["meal_plan_id"], name: "index_meals_on_meal_plan_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dinner_id"
    t.integer "meal_plan_id"
    t.boolean "show_only_loved_meals", default: false
    t.index ["dinner_id"], name: "index_users_on_dinner_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["meal_plan_id"], name: "index_users_on_meal_plan_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dinner_tags", "tags"
  add_foreign_key "dinners", "users"
  add_foreign_key "loves", "dinners"
  add_foreign_key "loves", "users"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "meals", "meal_plans"
  add_foreign_key "users", "dinners"
  add_foreign_key "users", "meal_plans"
end
