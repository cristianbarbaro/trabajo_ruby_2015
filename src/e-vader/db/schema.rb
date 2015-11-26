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

ActiveRecord::Schema.define(version: 20151125232920) do

  create_table "client_contacts", force: :cascade do |t|
    t.integer "client_id",  null: false
    t.integer "contact_id", null: false
    t.string  "value",      null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "firstname",                  null: false
    t.string   "lastname",                   null: false
    t.date     "birthdate",                  null: false
    t.string   "genre",                      null: false
    t.string   "document_number",            null: false
    t.string   "identification_code_type",   null: false
    t.string   "identification_code_number", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "contact_type", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.text     "description",    null: false
    t.float    "total_amount",   null: false
    t.date     "discharge_date", null: false
    t.integer  "client_id",      null: false
    t.integer  "person_id",      null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "identification_code_type"
    t.string   "identification_code_number"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
