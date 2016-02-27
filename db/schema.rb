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

ActiveRecord::Schema.define(version: 20160219222704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "facebook_id"
    t.integer  "attending_count"
    t.boolean  "can_guests_invite"
    t.string   "category"
    t.integer  "cover_offset_x"
    t.integer  "cover_offset_y"
    t.string   "cover_source"
    t.string   "cover_id"
    t.integer  "declined_count"
    t.text     "description"
    t.datetime "end_time"
    t.boolean  "guest_list_enabled"
    t.integer  "interested_count"
    t.boolean  "is_page_owned"
    t.boolean  "is_viewer_admin"
    t.integer  "maybe_count"
    t.string   "name"
    t.integer  "noreply_count"
    t.string   "owner_name"
    t.string   "owner_id"
    t.string   "parent_group"
    t.string   "place_name"
    t.string   "place_location_city"
    t.string   "place_location_country"
    t.float    "place_location_latitude"
    t.float    "place_location_longitude"
    t.string   "place_location_state"
    t.string   "place_location_street"
    t.string   "place_id"
    t.datetime "start_time"
    t.string   "timezone"
    t.datetime "updated_time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
