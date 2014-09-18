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

ActiveRecord::Schema.define(version: 20140918132547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "blocks", force: true do |t|
    t.string   "network_start_ip"
    t.integer  "network_prefix_length"
    t.integer  "geoname_id"
    t.integer  "registered_country_geoname_id"
    t.integer  "represented_country_geoname_id"
    t.string   "postal_code"
    t.decimal  "latitude",                                                                                precision: 7, scale: 4
    t.decimal  "longitude",                                                                               precision: 7, scale: 4
    t.boolean  "is_anonymous_proxy"
    t.boolean  "is_satellite_provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "lonlat",                         limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

  add_index "blocks", ["geoname_id"], name: "index_blocks_on_geoname_id"

  create_table "locations", force: true do |t|
    t.integer  "geoname_id"
    t.string   "continent_code"
    t.string   "continent_name"
    t.string   "country_iso_code"
    t.string   "country_name"
    t.string   "subdivision_iso_code"
    t.string   "subdivision_name"
    t.string   "city_name"
    t.integer  "metro_code"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "lonlat",               limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

  create_table "pins", force: true do |t|
    t.decimal  "longitude",                                                           precision: 17, scale: 14
    t.decimal  "latitude",                                                            precision: 17, scale: 14
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "lonlat",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

end
