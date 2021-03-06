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

ActiveRecord::Schema.define(version: 2019_10_29_065829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["phone"], name: "index_customers_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_customers_on_username", unique: true
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.string "time"
    t.decimal "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "programmer_id"
    t.bigint "project_id"
    t.boolean "is_accepted", default: false
    t.index ["programmer_id"], name: "index_offers_on_programmer_id"
    t.index ["project_id"], name: "index_offers_on_project_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "image"
    t.boolean "is_employed"
    t.text "about"
    t.string "cv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "programmer_id"
    t.index ["programmer_id"], name: "index_portfolios_on_programmer_id"
  end

  create_table "programmers", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_programmers_on_email", unique: true
    t.index ["phone"], name: "index_programmers_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_programmers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_programmers_on_username", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "status"
    t.text "description"
    t.text "requirements"
    t.decimal "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.string "name"
    t.index ["customer_id"], name: "index_projects_on_customer_id"
  end

  create_table "software_engineerings", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_software_engineerings_on_email", unique: true
    t.index ["reset_password_token"], name: "index_software_engineerings_on_reset_password_token", unique: true
  end

  add_foreign_key "offers", "programmers"
  add_foreign_key "offers", "projects"
  add_foreign_key "portfolios", "programmers"
  add_foreign_key "projects", "customers"
end
