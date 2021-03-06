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

ActiveRecord::Schema.define(version: 2018_08_16_183819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer "biller_id", null: false
    t.integer "bill_recipient_id", null: false
    t.text "description", null: false
    t.float "balance", null: false
    t.string "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_recipient_id"], name: "index_bills_on_bill_recipient_id"
    t.index ["biller_id"], name: "index_bills_on_biller_id"
  end

  create_table "friendings", force: :cascade do |t|
    t.integer "friender_id", null: false
    t.integer "friendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendee_id"], name: "index_friendings_on_friendee_id"
    t.index ["friender_id", "friendee_id"], name: "index_friendings_on_friender_id_and_friendee_id", unique: true
    t.index ["friender_id"], name: "index_friendings_on_friender_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount_paid", null: false
    t.integer "bill_id", null: false
    t.integer "trans_initiator_id", null: false
    t.integer "trans_recipient_id", null: false
    t.boolean "settled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_transactions_on_bill_id"
    t.index ["trans_initiator_id"], name: "index_transactions_on_trans_initiator_id"
    t.index ["trans_recipient_id"], name: "index_transactions_on_trans_recipient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

end
