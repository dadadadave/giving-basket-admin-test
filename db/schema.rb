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

ActiveRecord::Schema.define(version: 2020_03_12_021846) do

  create_table "checks", force: :cascade do |t|
    t.integer "amount"
    t.datetime "sent_at"
    t.integer "nonprofit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nonprofit_id"], name: "index_checks_on_nonprofit_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "amount"
    t.integer "nonprofit_id", null: false
    t.integer "check_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_id"], name: "index_donations_on_check_id"
    t.index ["nonprofit_id"], name: "index_donations_on_nonprofit_id"
  end

  create_table "nonprofits", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "stripe_acct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "checks", "nonprofits"
  add_foreign_key "donations", "checks"
  add_foreign_key "donations", "nonprofits"
end
