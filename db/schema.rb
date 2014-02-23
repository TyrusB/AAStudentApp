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

ActiveRecord::Schema.define(version: 20140223002945) do

  create_table "annotations", force: true do |t|
    t.integer  "source_file_id"
    t.string   "body"
    t.integer  "start_pos"
    t.integer  "end_pos"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessments", force: true do |t|
    t.string   "name",         null: false
    t.integer  "cohort_id",    null: false
    t.string   "description"
    t.datetime "start_time"
    t.integer  "duration"
    t.integer  "maximum_mark", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "annotation_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_reports", force: true do |t|
    t.integer  "week"
    t.integer  "day"
    t.boolean  "finished_exercises"
    t.boolean  "read_solutions"
    t.boolean  "read_tomorrows_readings"
    t.integer  "rating_of_understanding"
    t.string   "easiest_concept"
    t.string   "hardest_concept"
    t.string   "pair_name"
    t.integer  "pair_rating"
    t.text     "pair_comments"
    t.text     "daily_comments"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daily_reports", ["day"], name: "index_daily_reports_on_day"
  add_index "daily_reports", ["user_id"], name: "index_daily_reports_on_user_id"
  add_index "daily_reports", ["week", "day", "user_id"], name: "index_daily_reports_on_week_and_day_and_user_id", unique: true
  add_index "daily_reports", ["week"], name: "index_daily_reports_on_week"

  create_table "report_comments", force: true do |t|
    t.text     "body",            null: false
    t.integer  "daily_report_id", null: false
    t.integer  "ta_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_comments", ["daily_report_id"], name: "index_report_comments_on_daily_report_id"
  add_index "report_comments", ["ta_id"], name: "index_report_comments_on_ta_id"

  create_table "source_files", force: true do |t|
    t.string   "file_path",     null: false
    t.string   "body",          null: false
    t.integer  "submission_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "assessment_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "name",                            null: false
    t.string   "session_token",                   null: false
    t.string   "password_digest",                 null: false
    t.integer  "ta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["session_token"], name: "index_users_on_session_token"
  add_index "users", ["ta_id"], name: "index_users_on_ta_id"

end
