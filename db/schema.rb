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

ActiveRecord::Schema.define(version: 20150821233229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fencers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "club_id"
    t.string   "usfa_id"
    t.string   "fencer_id"
  end

  create_table "results", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fencer_id"
    t.string   "result_id"
    t.string   "event_id"
    t.string   "tournament_id"
    t.string   "tournament_name"
    t.integer  "entries"
    t.string   "event_date"
    t.integer  "place"
    t.string   "rating_earned"
    t.string   "event_rating"
  end

  add_index "results", ["fencer_id"], name: "index_results_on_fencer_id", using: :btree

  create_table "round_results", force: true do |t|
    t.string   "event_id"
    t.string   "tournament_id"
    t.integer  "fencer_id"
    t.string   "round_type"
    t.integer  "opponent_id"
    t.string   "opponent_first"
    t.string   "opponent_last"
    t.integer  "opponent_score"
    t.integer  "opponent_seed"
    t.integer  "score"
    t.integer  "seed"
    t.string   "victory"
    t.integer  "opponent_club_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "result_id"
  end

  add_index "round_results", ["result_id"], name: "index_round_results_on_result_id", using: :btree

end
