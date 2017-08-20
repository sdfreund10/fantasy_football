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

ActiveRecord::Schema.define(version: 20170816011105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nfl_teams", force: :cascade do |t|
    t.string "team_name", null: false
    t.integer "year_min"
    t.integer "year_max"
    t.integer "wins"
    t.integer "losses"
    t.integer "ties"
    t.integer "win_loss_perc"
    t.integer "av"
    t.integer "years_playoffs"
    t.integer "championships"
    t.integer "championships_super_bowl"
    t.integer "championships_conference"
    t.integer "championships_division"
  end

  create_table "pfr_approximate_value_stats", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "year"
    t.integer "av"
    t.index ["player_id"], name: "index_pfr_approximate_value_stats_on_player_id"
  end

  create_table "pfr_defense_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "age"
    t.string "team", null: false
    t.string "pos"
    t.integer "uniform_number"
    t.integer "g", default: 0
    t.integer "gs", default: 0
    t.integer "def_int", default: 0
    t.integer "def_int_yds", default: 0
    t.integer "def_int_td", default: 0
    t.integer "def_int_long", default: 0
    t.integer "pass_defended", default: 0
    t.integer "fumbles_forced", default: 0
    t.integer "fumbles", default: 0
    t.integer "fumbles_rec", default: 0
    t.integer "fumbles_rec_yds", default: 0
    t.integer "fumbles_rec_td", default: 0
    t.float "sacks", default: 0.0
    t.integer "tackles_solo", default: 0
    t.integer "tackles_assists", default: 0
    t.integer "safety_md", default: 0
    t.integer "type"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_defense_stats_on_player_id"
  end

  create_table "pfr_fantasy_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.string "team"
    t.string "fantasy_pos"
    t.integer "age"
    t.integer "g"
    t.integer "gs"
    t.integer "pass_cmp"
    t.integer "pass_att"
    t.integer "pass_yds"
    t.integer "pass_td"
    t.integer "pass_int"
    t.integer "rush_att"
    t.integer "rush_yds"
    t.float "rush_yds_per_att"
    t.integer "rush_td"
    t.integer "targets"
    t.integer "rec"
    t.integer "rec_yds"
    t.float "rec_yds_per_rec"
    t.integer "rec_td"
    t.integer "fantasy_points"
    t.float "draftkings_points"
    t.float "fanduel_points"
    t.integer "vbd"
    t.integer "fantasy_rank_pos"
    t.integer "fantasy_rank_overall"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_fantasy_stats_on_player_id"
  end

  create_table "pfr_games_played_stats", force: :cascade do |t|
    t.integer "year"
    t.integer "age"
    t.string "team"
    t.integer "pos"
    t.integer "uniform_number"
    t.integer "g"
    t.integer "gs"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_games_played_stats_on_player_id"
  end

  create_table "pfr_kicking_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "age"
    t.string "team"
    t.string "pos"
    t.integer "uniform_number"
    t.integer "g"
    t.integer "gs"
    t.integer "fga1"
    t.integer "fgm1"
    t.integer "fga2"
    t.integer "fgm2"
    t.integer "fga3"
    t.integer "fgm3"
    t.integer "fga4"
    t.integer "fgm4"
    t.integer "fga5"
    t.integer "fgm5"
    t.integer "fga"
    t.integer "fgm"
    t.integer "fg_long"
    t.float "fg_perc"
    t.integer "xpa"
    t.integer "xpm"
    t.float "xp_perc"
    t.integer "punt"
    t.integer "punt_yds"
    t.integer "punt_long"
    t.integer "punt_blocked"
    t.integer "punt_yds_per_punt"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_kicking_stats_on_player_id"
  end

  create_table "pfr_passing_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "age"
    t.string "team"
    t.string "pos"
    t.integer "uniform_number"
    t.integer "g"
    t.integer "gs"
    t.integer "qb_rec"
    t.float "pass_cmp"
    t.integer "pass_att"
    t.integer "pass_cmp_perc"
    t.integer "pass_yds"
    t.integer "pass_td"
    t.float "pass_td_perc"
    t.integer "pass_int"
    t.float "pass_int_perc"
    t.integer "pass_long"
    t.float "pass_yds_per_att"
    t.float "pass_adj_yds_per_att"
    t.float "pass_yds_per_cmp"
    t.float "pass_yds_per_g"
    t.float "pass_rating"
    t.float "qbr"
    t.integer "pass_sacked"
    t.integer "pass_sacked_yds"
    t.float "pass_net_yds_per_att"
    t.float "pass_adj_net_yds_per_att"
    t.float "pass_sacked_perc"
    t.integer "comebacks"
    t.integer "gwd"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_passing_stats_on_player_id"
  end

  create_table "pfr_receiving_and_rushing_stats", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "age"
    t.string "team", null: false
    t.string "pos"
    t.integer "uniform_number"
    t.integer "g"
    t.integer "gs"
    t.integer "rush_att"
    t.integer "rush_yds"
    t.integer "rush_td"
    t.integer "rush_long"
    t.float "rush_yds_per_att"
    t.float "rush_yds_per_g"
    t.float "rush_att_per_g"
    t.integer "targets"
    t.integer "rec"
    t.integer "rec_yds"
    t.integer "rec_yds_per_rec"
    t.integer "rec_td"
    t.integer "rec_long"
    t.float "rec_per_g"
    t.float "rec_yds_per_g"
    t.float "catch_pct"
    t.integer "yds_from_scrimmage"
    t.integer "rush_receive_td"
    t.integer "fumbles"
    t.boolean "pro_bowl"
    t.boolean "all_pro"
    t.bigint "player_id"
    t.bigint "team_id"
    t.index ["player_id"], name: "index_pfr_receiving_and_rushing_stats_on_player_id"
    t.index ["team_id"], name: "index_pfr_receiving_and_rushing_stats_on_team_id"
  end

  create_table "pfr_return_stats", force: :cascade do |t|
    t.integer "year"
    t.integer "age"
    t.string "team"
    t.string "pos"
    t.integer "uniform_number"
    t.integer "g"
    t.integer "gs"
    t.integer "punt_ret"
    t.integer "punt_ret_yds"
    t.integer "punt_ret_td"
    t.integer "punt_ret_long"
    t.float "punt_ret_yds_per_ret"
    t.integer "kick_ret"
    t.integer "kick_ret_yds"
    t.integer "kick_ret_td"
    t.integer "kick_ret_long"
    t.float "kick_ret_yds_per_ret"
    t.integer "all_purpose_yds"
    t.bigint "player_id"
    t.index ["player_id"], name: "index_pfr_return_stats_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "position"
    t.string "hand"
    t.integer "height"
    t.integer "weight"
    t.string "current_team"
    t.date "dob", null: false
    t.string "birth_city"
    t.string "birth_state"
    t.string "college"
    t.integer "wgt_av"
    t.integer "wgt_av_rank"
  end

end
