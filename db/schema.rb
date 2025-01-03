# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_22_142800) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_health_data", id: false, force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "health_datum_id", null: false
  end

  create_table "fake_cities", force: :cascade do |t|
    t.string "city_name"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_data", force: :cascade do |t|
    t.string "region", null: false
    t.integer "year", null: false
    t.float "disease_prevalence", null: false
    t.float "vaccination_rate", null: false
    t.integer "healthcare_availability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "city_name"
    t.float "temperature"
    t.integer "humidity"
    t.float "wind_speed"
    t.string "weather_condition"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "health_data_id", null: false
    t.index ["health_data_id"], name: "index_weathers_on_health_data_id"
  end

  add_foreign_key "weathers", "health_data", column: "health_data_id"
end
