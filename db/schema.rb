# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150618091631) do

  create_table "alumni_data", force: true do |t|
    t.integer  "alumni_id"
    t.string   "company"
    t.string   "designation"
    t.string   "home_address"
    t.string   "office_address"
    t.string   "home_phone"
    t.string   "office_phone"
    t.string   "mobile_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email1"
    t.string   "email2"
    t.string   "call_next_at",    default: "2016-01-23 09:00"
    t.string   "payment_details"
  end

  add_index "alumni_data", ["alumni_id"], name: "index_alumni_data_on_alumni_id"

  create_table "alumni_statuses", force: true do |t|
    t.integer  "alumni_id"
    t.integer  "search"
    t.integer  "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alumni_statuses", ["alumni_id"], name: "index_alumni_statuses_on_alumni_id"

  create_table "alumnis", force: true do |t|
    t.string   "name"
    t.string   "year"
    t.string   "hall",       default: "Unknown"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "department"
  end

  create_table "bills", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "imageurl"
    t.float    "amount"
    t.text     "dateofpurchase"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "resolved"
    t.integer  "userid"
    t.integer  "usertype"
  end

  create_table "coordinators", force: true do |t|
    t.string   "name"
    t.string   "rollnum"
    t.string   "portfolio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "coordinators", ["email"], name: "index_coordinators_on_email", unique: true
  add_index "coordinators", ["reset_password_token"], name: "index_coordinators_on_reset_password_token", unique: true

  create_table "student_members", force: true do |t|
    t.string   "name"
    t.string   "rollnum"
    t.string   "portfolio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "student_members", ["email"], name: "index_student_members_on_email", unique: true
  add_index "student_members", ["reset_password_token"], name: "index_student_members_on_reset_password_token", unique: true

  create_table "tie_alumni_with_student_members", force: true do |t|
    t.integer  "alumni_id"
    t.integer  "studentmember_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tie_alumni_with_student_members", ["alumni_id"], name: "index_tie_alumni_with_student_members_on_alumni_id"
  add_index "tie_alumni_with_student_members", ["studentmember_id"], name: "index_tie_alumni_with_student_members_on_studentMember_id"

end
