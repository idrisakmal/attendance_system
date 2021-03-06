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

ActiveRecord::Schema.define(version: 20170124181737) do

  create_table "attendances", force: :cascade do |t|
    t.string   "day",        limit: 255
    t.date     "date"
    t.string   "status",     limit: 255
    t.integer  "student_id", limit: 4
    t.integer  "section_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "attendances", ["section_id"], name: "index_attendances_on_section_id", using: :btree
  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id", using: :btree

  create_table "lecturers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "contact_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "section_students", id: false, force: :cascade do |t|
    t.integer  "section_id", limit: 4
    t.integer  "student_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "section_students", ["section_id"], name: "index_section_students_on_section_id", using: :btree
  add_index "section_students", ["student_id"], name: "index_section_students_on_student_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "lecturer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sections", ["lecturer_id"], name: "index_sections_on_lecturer_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "contact_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
