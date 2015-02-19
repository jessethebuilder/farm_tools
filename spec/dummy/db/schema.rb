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

ActiveRecord::Schema.define(version: 20150218022340) do

  create_table "addresses", force: true do |t|
    t.string   "label"
    t.string   "street"
    t.string   "street2"
    t.string   "street3"
    t.string   "number"
    t.string   "care_of"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "has_address_type"
    t.integer  "has_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_infos", force: true do |t|
    t.string "phone"
    t.string "phone2"
    t.string "phone3"
    t.string "main_email"
    t.string "billing_email"
    t.string "website_url"
  end

  create_table "farm_slugs_objects", force: true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "gens", force: true do |t|
    t.text     "fake_array"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "an_attr"
  end

  create_table "social_networking_profiles", force: true do |t|
    t.string   "facebook_app_id"
    t.string   "facebook_app_secret"
    t.string   "facebook_id"
    t.string   "twitter_app_id"
    t.string   "twitter_id"
    t.string   "has_social_networking_id"
    t.string   "has_social_networking_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tumblr_id"
    t.string   "google_plus_id"
    t.string   "pinterest_id"
    t.string   "instagram_id"
  end

  create_table "test_companies", force: true do |t|
    t.string   "name"
    t.integer  "test_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_models", force: true do |t|
    t.string   "string"
    t.string   "string2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
