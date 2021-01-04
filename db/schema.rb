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

ActiveRecord::Schema.define(version: 2021_01_04_113032) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "book_from", default: "", null: false
    t.string "book_to", default: "", null: false
    t.string "room", default: "", null: false
    t.string "bed", default: "", null: false
    t.string "payment", default: "", null: false
    t.string "fee", default: "", null: false
    t.string "dob", default: "", null: false
    t.string "age", default: "", null: false
    t.string "contact", default: "", null: false
    t.string "address", default: "", null: false
    t.string "discharge_reason", default: "", null: false
    t.string "car_needs", default: "", null: false
    t.string "diagnosis_history", default: "", null: false
    t.string "behaviours", default: "", null: false
    t.string "substance", default: "", null: false
    t.string "assistance", default: "", null: false
    t.string "casemanager", default: "", null: false
    t.string "social_worker", default: "", null: false
    t.string "forensic_history", default: "", null: false
    t.string "notes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fee_freq"
  end

  create_table "complaints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "complaint", default: "", null: false
    t.string "nature", default: "", null: false
    t.string "action", default: "", null: false
    t.string "method", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "incident_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "incident_type", limit: 256
    t.string "other_type", default: "", null: false
    t.string "description", default: "", null: false
    t.string "action", default: "", null: false
    t.string "staff", default: "", null: false
    t.string "follow_notes", default: "", null: false
    t.string "follow_staff", default: "", null: false
    t.string "person_other", default: "", null: false
    t.string "notify_date", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "Hygiene", default: "", null: false
    t.string "nutrition", default: "", null: false
    t.string "health_care", default: "", null: false
    t.string "medication", default: "", null: false
    t.string "social_contact", default: "", null: false
    t.string "behaviour", default: "", null: false
    t.string "goals", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobility"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
