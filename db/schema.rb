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

ActiveRecord::Schema.define(version: 20171030132346) do

  create_table "daily_travel_infos", force: :cascade do |t|
    t.date "date"
    t.text "weather"
    t.text "special_events"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "segment_by_time_snapshots" because of following StandardError
#   Unknown type 'reference' for column 'daily_travel_info'

  create_table "segment_snapshots", force: :cascade do |t|
    t.float "travel_time"
    t.float "expected_travel_time"
    t.integer "segment_id"
    t.float "end_mile_marker"
    t.float "start_mile_marker"
    t.string "segment_name"
    t.string "road_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_captured"
    t.date "date_captured"
  end

# Could not dump table "segment_travel_times" because of following StandardError
#   Unknown type 'reference' for column 'segment_by_time_snapshot'

  create_table "segments", force: :cascade do |t|
    t.integer "road_id"
    t.integer "speed_limit"
    t.string "segment_type"
    t.integer "segment_id"
    t.float "end_mile_marker"
    t.float "length"
    t.float "start_mile_marker"
    t.string "road_name"
    t.string "segment_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traffic_snapshots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
