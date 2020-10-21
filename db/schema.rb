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

ActiveRecord::Schema.define(version: 2020_10_21_193013) do

  create_table "rushings", force: :cascade do |t|
    t.string "player"
    t.string "team"
    t.string "pos"
    t.integer "att", default: 0
    t.decimal "att_by_g", default: "0.0"
    t.decimal "yds", default: "0.0"
    t.decimal "avg", default: "0.0"
    t.decimal "yds_by_g", default: "0.0"
    t.decimal "td", default: "0.0"
    t.string "lng"
    t.decimal "first", default: "0.0"
    t.float "first_percentage", default: 0.0
    t.decimal "twenty_plus", default: "0.0"
    t.decimal "forty_plus", default: "0.0"
    t.decimal "fum", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lng"], name: "index_rushings_on_lng"
    t.index ["player"], name: "index_rushings_on_player"
    t.index ["td"], name: "index_rushings_on_td"
    t.index ["team"], name: "index_rushings_on_team"
    t.index ["yds"], name: "index_rushings_on_yds"
  end

end
