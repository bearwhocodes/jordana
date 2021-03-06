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

ActiveRecord::Schema.define(version: 20171028173311) do

  create_table "bootsy_image_galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "bootsy_resource_type"
    t.bigint "bootsy_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bootsy_resource_type", "bootsy_resource_id"], name: "index_bootsy_image_galleries"
  end

  create_table "bootsy_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_file"
    t.bigint "image_gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_gallery_id"], name: "index_bootsy_images_on_image_gallery_id"
  end

  create_table "enquiries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "message_type"
    t.text "message"
    t.integer "project_budget"
    t.text "project_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "initial_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "html"
    t.datetime "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug"
    t.text "html"
    t.bigint "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_elements_on_page_id"
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
