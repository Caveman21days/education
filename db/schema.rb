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

ActiveRecord::Schema.define(version: 20180719063104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer "field_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description", default: "", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description", default: "", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.integer "user_id"
    t.string "topic_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forums_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "issuable_id"
    t.string "issuable_type"
    t.integer "author_id"
    t.string "title", null: false
    t.text "body", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issuable_id", "issuable_type"], name: "index_issues_on_issuable_id_and_issuable_type"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description", default: "", null: false
    t.integer "stage"
    t.integer "nti"
    t.integer "bortnik"
    t.integer "project_type"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "info", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "issue_id"
    t.text "body"
    t.integer "recipient_id"
    t.string "status"
  end

  create_table "user_assignments", force: :cascade do |t|
    t.integer "assignmentable_id"
    t.string "assignmentable_type"
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "issue_state"
    t.index ["assignmentable_id", "user_id"], name: "index_user_assignments_on_assignmentable_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "l_name"
    t.string "f_name"
    t.string "s_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "super_admin"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
