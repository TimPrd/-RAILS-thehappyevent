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

ActiveRecord::Schema.define(version: 20161111185212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evenements", force: :cascade do |t|
    t.string   "adresse"
    t.integer  "numero"
    t.string   "route"
    t.integer  "zipCode"
    t.string   "ville"
    t.string   "pays"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "isPrivate"
    t.integer  "userId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pwd"
    t.string   "address"
    t.date     "datee"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "tel"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
