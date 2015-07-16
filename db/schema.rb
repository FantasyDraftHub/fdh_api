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

ActiveRecord::Schema.define(version: 20150714001557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fantasy_draft_picks", force: :cascade do |t|
    t.integer  "fantasy_draft_id"
    t.integer  "fantasy_team_id"
    t.integer  "player_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fantasy_draft_picks", ["fantasy_draft_id"], name: "index_fantasy_draft_picks_on_fantasy_draft_id", using: :btree
  add_index "fantasy_draft_picks", ["fantasy_team_id"], name: "index_fantasy_draft_picks_on_fantasy_team_id", using: :btree
  add_index "fantasy_draft_picks", ["player_id"], name: "index_fantasy_draft_picks_on_player_id", using: :btree

  create_table "fantasy_draft_styles", force: :cascade do |t|
    t.string "name"
  end

  create_table "fantasy_drafts", force: :cascade do |t|
    t.integer  "fantasy_draft_style_id"
    t.integer  "user_id"
    t.string   "name",                   null: false
    t.integer  "max"
    t.integer  "rounds"
    t.string   "password"
    t.string   "url"
    t.string   "season",                 null: false
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
  end

  add_index "fantasy_drafts", ["fantasy_draft_style_id"], name: "index_fantasy_drafts_on_fantasy_draft_style_id", using: :btree
  add_index "fantasy_drafts", ["player_id"], name: "index_fantasy_drafts_on_player_id", using: :btree
  add_index "fantasy_drafts", ["url"], name: "index_fantasy_drafts_on_url", using: :btree
  add_index "fantasy_drafts", ["user_id"], name: "index_fantasy_drafts_on_user_id", using: :btree

  create_table "fantasy_teams", force: :cascade do |t|
    t.integer  "fantasy_draft_id"
    t.string   "name"
    t.string   "owner"
    t.boolean  "active"
    t.integer  "draft_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fantasy_teams", ["fantasy_draft_id"], name: "index_fantasy_teams_on_fantasy_draft_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "key"
  end

  create_table "players", force: :cascade do |t|
    t.integer "league_id"
    t.integer "team_id"
    t.integer "position_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "season"
    t.boolean "active"
  end

  add_index "players", ["league_id"], name: "index_players_on_league_id", using: :btree
  add_index "players", ["position_id"], name: "index_players_on_position_id", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer "league_id"
    t.string  "name"
    t.string  "key"
  end

  add_index "positions", ["key"], name: "index_positions_on_key", using: :btree
  add_index "positions", ["league_id"], name: "index_positions_on_league_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer "league_id"
    t.string  "city"
    t.string  "name"
    t.string  "key"
  end

  add_index "teams", ["key"], name: "index_teams_on_key", using: :btree
  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree

  add_foreign_key "fantasy_draft_picks", "fantasy_drafts"
  add_foreign_key "fantasy_draft_picks", "fantasy_teams"
  add_foreign_key "fantasy_draft_picks", "players"
  add_foreign_key "fantasy_drafts", "fantasy_draft_styles"
  add_foreign_key "fantasy_drafts", "players"
  add_foreign_key "fantasy_drafts", "users"
  add_foreign_key "fantasy_teams", "fantasy_drafts"
  add_foreign_key "players", "leagues"
  add_foreign_key "players", "positions"
  add_foreign_key "players", "teams"
  add_foreign_key "positions", "leagues"
  add_foreign_key "teams", "leagues"
end
