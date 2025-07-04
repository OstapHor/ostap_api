# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_06_10_203701) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.integer "realtor_id", null: false
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_contracts_on_property_id"
    t.index ["realtor_id"], name: "index_contracts_on_realtor_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_type"
    t.string "location"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "realtor_id", null: false
    t.integer "property_id", null: false
    t.integer "final_rating"
    t.integer "security_rating"
    t.integer "infrastructure_rating"
    t.integer "location_to_city_center_rating"
    t.integer "maintenance_rating"
    t.integer "neighborhood_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_ratings_on_property_id"
    t.index ["realtor_id"], name: "index_ratings_on_realtor_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "realtors", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.float "rating"
    t.string "contactinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "contracts", "properties"
  add_foreign_key "contracts", "realtors"
  add_foreign_key "contracts", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "ratings", "properties"
  add_foreign_key "ratings", "realtors"
  add_foreign_key "ratings", "users"
end
