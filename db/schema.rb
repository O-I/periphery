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

ActiveRecord::Schema.define(version: 20131217233730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: true do |t|
    t.integer "person_id"
    t.integer "company_id"
  end

  add_index "affiliations", ["company_id"], name: "index_affiliations_on_company_id", using: :btree
  add_index "affiliations", ["person_id"], name: "index_affiliations_on_person_id", using: :btree

  create_table "associations", force: true do |t|
    t.integer "person_id"
    t.integer "associate_id"
  end

  add_index "associations", ["associate_id"], name: "index_associations_on_associate_id", using: :btree
  add_index "associations", ["person_id"], name: "index_associations_on_person_id", using: :btree

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
    t.text    "relationships"
    t.boolean "acquired?",           default: false
    t.boolean "died?",               default: false
    t.integer "number_of_employees"
    t.integer "founded_year"
    t.integer "acquired_year"
    t.integer "death_year"
  end

  create_table "people", force: true do |t|
    t.text    "first_name"
    t.text    "last_name"
    t.text    "permalink"
    t.text    "homepage_url"
    t.text    "birthplace"
    t.text    "twitter_username"
    t.text    "linkedin_url"
    t.text    "blog_url"
    t.text    "github_url"
    t.text    "angellist_url"
    t.text    "image"
    t.text    "tags"
    t.text    "investments"
    t.text    "relationships"
    t.integer "born_day"
    t.integer "born_month"
    t.integer "born_year"
  end

end
