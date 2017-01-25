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

ActiveRecord::Schema.define(version: 20170124155905) do
  
enable_extension "plpgsql"

  create_table "classifications", force: :cascade do |t|
    t.string   "nom_classification"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "classifications_films", id: false, force: :cascade do |t|
    t.integer "classification_id", null: false
    t.integer "film_id",           null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "titrefilm"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "distribution"
    t.string   "affiche"
  end

  create_table "seances", force: :cascade do |t|
    t.string   "projection"
    t.string   "caisse"
    t.datetime "horaire"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "annulee"
    t.string   "version"
    t.string   "commentaire"
    t.integer  "film_id"
    t.integer  "village_id"
    t.string   "extras"
    t.integer  "billets_adultes"
    t.integer  "billets_enfants"
    t.integer  "billets_scolaires"
    t.integer  "total_billets"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nom"
    t.string   "prenom"
    t.string   "telephone"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "villages", force: :cascade do |t|
    t.string   "commune"
    t.string   "salle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
