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

ActiveRecord::Schema.define(version: 20150608024111) do

  create_table "departments", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "email"
    t.string   "password_hash"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payroll_cycles", force: :cascade do |t|
    t.integer  "year"
    t.integer  "cycle_number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_sheet_segments", force: :cascade do |t|
    t.integer "project_id"
    t.integer "employee_id"
    t.integer "payroll_cycle_id"
  end

  create_table "time_sheets", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "payroll_cycle_id"
    t.text    "notes"
  end

  create_table "work_segments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "employee_id"
    t.integer  "payroll_cycle_id"
    t.datetime "date"
    t.float    "hours"
  end

end
