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

ActiveRecord::Schema.define(version: 20131217125251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.text    "name"
    t.text    "permalink"
    t.text    "description"
    t.text    "overview"
    t.text    "one_line_pitch"
    t.text    "category"
    t.text    "logo_url"
    t.text    "homepage_url"
    t.text    "blog_url"
    t.text    "email_address"
    t.text    "phone_number"
    t.text    "offices"
    t.text    "tags",                default: "--- []\n"
    t.text    "twitter_username"
    t.text    "total_money_raised"
    t.text    "acquired_price"
    t.text    "acquirer"
    t.boolean "acquired?",           default: false
    t.boolean "died?",               default: false
    t.integer "number_of_employees"
    t.integer "founded_year"
    t.integer "acquired_year"
    t.integer "death_year"
  end

end
