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

ActiveRecord::Schema.define(version: 2020_06_28_163952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classifications", id: :serial, force: :cascade do |t|
    t.string "nom_classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications_films", id: false, force: :cascade do |t|
    t.integer "classification_id", null: false
    t.integer "film_id", null: false
  end

  create_table "disponibilites", id: :serial, force: :cascade do |t|
    t.string "nom"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", id: :serial, force: :cascade do |t|
    t.string "titrefilm"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "distribution"
    t.string "affiche"
    t.integer "import_id"
  end

  create_table "seances", id: :serial, force: :cascade do |t|
    t.string "projection"
    t.string "caisse"
    t.datetime "horaire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "annulee"
    t.string "version"
    t.string "commentaire"
    t.integer "film_id"
    t.integer "village_id"
    t.string "extras"
    t.integer "billets_adultes"
    t.integer "billets_enfants"
    t.integer "billets_scolaires"
    t.integer "total_billets"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "prenom"
    t.string "telephone"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "villages", id: :serial, force: :cascade do |t|
    t.string "commune"
    t.string "salle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "import_id"
  end

end
