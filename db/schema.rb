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

ActiveRecord::Schema.define(version: 2020_08_31_024522) do

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "statement"
    t.integer "idea_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_goals_on_category_id"
    t.index ["idea_id"], name: "index_goals_on_idea_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.string "inspiration"
    t.text "plan"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supports", force: :cascade do |t|
    t.integer "budgeted_dollars"
    t.integer "spent_dollars"
    t.integer "budgeted_dollars_remaining"
    t.boolean "within_budget"
    t.integer "idea_id", null: false
    t.integer "resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["idea_id"], name: "index_supports_on_idea_id"
    t.index ["resource_id"], name: "index_supports_on_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "goals", "categories"
  add_foreign_key "goals", "ideas"
  add_foreign_key "ideas", "users"
  add_foreign_key "supports", "ideas"
  add_foreign_key "supports", "resources"
end
