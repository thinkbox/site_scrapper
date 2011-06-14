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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110524054433) do

  create_table "cangos", :force => true do |t|
    t.string   "sourceurl"
    t.string   "ca_memberid"
    t.string   "ngo_name"
    t.string   "representative"
    t.string   "ca_tilldate"
    t.string   "contact_address"
    t.string   "focus_district"
    t.string   "focus_state"
    t.string   "focus_region"
    t.string   "contact_tel"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gsifocus", :force => true do |t|
    t.string   "gsingo_id"
    t.string   "type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gsingos", :force => true do |t|
    t.string   "sourceurl"
    t.string   "gsi_id"
    t.string   "ngo_name"
    t.string   "contact_addressline"
    t.string   "contact_city"
    t.string   "contact_district"
    t.string   "contact_state"
    t.string   "contact_pin"
    t.string   "pc_id"
    t.string   "contact_phone1"
    t.string   "contact_phone2"
    t.string   "contact_emailid"
    t.string   "contact_weburl"
    t.string   "startingyear"
    t.string   "fulltimestaff"
    t.string   "fulltimevol"
    t.boolean  "iscrediblealliance"
    t.string   "reg_as"
    t.string   "reg_in_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gsiregs", :force => true do |t|
    t.string   "gsingo_id"
    t.string   "type"
    t.string   "docurl"
    t.string   "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcfocus", :force => true do |t|
    t.string   "pcngo_id"
    t.string   "typestr"
    t.string   "val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcngos", :force => true do |t|
    t.string   "sourceurl"
    t.string   "ngo_name"
    t.string   "ngo_uid"
    t.string   "ngo_chieffunk"
    t.string   "ngo_chair"
    t.string   "ngo_sec"
    t.string   "ngo_trea"
    t.string   "ngo_promo1"
    t.string   "ngo_promo2"
    t.string   "ngo_parent"
    t.string   "reg_with"
    t.string   "reg_type"
    t.string   "reg_no"
    t.string   "reg_date"
    t.string   "reg_city"
    t.string   "reg_fcra"
    t.string   "reg_doc_link"
    t.string   "focus_issues"
    t.string   "focus_states"
    t.string   "focus_district"
    t.string   "contact_address"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_tel"
    t.string   "contact_mobile"
    t.string   "contact_email"
    t.string   "contact_website"
    t.string   "contact_fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
