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

ActiveRecord::Schema.define(version: 2018_08_23_144348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificates", force: :cascade do |t|
    t.string "name"
    t.string "institution"
    t.bigint "nutritionist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_certificates_on_nutritionist_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_ingredients_on_meal_id"
  end

  create_table "meal_plan_meals", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "meal_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_plan_meals_on_meal_id"
    t.index ["meal_plan_id"], name: "index_meal_plan_meals_on_meal_plan_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.string "name"
    t.integer "daily_calories"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "recipe"
    t.string "type"
    t.integer "calories"
    t.bigint "nutritionist_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["nutritionist_id"], name: "index_meals_on_nutritionist_id"
  end

  create_table "nutritionists", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "body"
    t.bigint "nutritionist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_reviews_on_nutritionist_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "nutritionist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_subscriptions_on_nutritionist_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "certificates", "nutritionists"
  add_foreign_key "ingredients", "meals"
  add_foreign_key "meal_plan_meals", "meal_plans"
  add_foreign_key "meal_plan_meals", "meals"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "meals", "nutritionists"
  add_foreign_key "reviews", "nutritionists"
  add_foreign_key "subscriptions", "nutritionists"
  add_foreign_key "subscriptions", "users"
end
