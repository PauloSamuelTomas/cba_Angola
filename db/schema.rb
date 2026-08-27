# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_27_164130) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "choir_id"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "department_id"
    t.text "description"
    t.string "location"
    t.text "objective"
    t.string "time"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["choir_id"], name: "index_activities_on_choir_id"
    t.index ["department_id"], name: "index_activities_on_department_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "email"
    t.integer "member_id", null: false
    t.string "name"
    t.integer "pastor_id", null: false
    t.string "phone"
    t.string "status"
    t.string "subject"
    t.string "time"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_appointments_on_member_id"
    t.index ["pastor_id"], name: "index_appointments_on_pastor_id"
  end

  create_table "baptisms", force: :cascade do |t|
    t.string "address"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "email"
    t.string "gender"
    t.string "location"
    t.string "name"
    t.integer "pastor_id", null: false
    t.string "phone"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["pastor_id"], name: "index_baptisms_on_pastor_id"
  end

  create_table "celulas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.integer "responsavel_id"
    t.datetime "updated_at", null: false
    t.index ["responsavel_id"], name: "index_celulas_on_responsavel_id"
  end

  create_table "choirs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "leader"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.string "responsavel"
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "address"
    t.date "birth_date"
    t.integer "celula_id"
    t.integer "choir_id"
    t.datetime "created_at", null: false
    t.integer "department_id"
    t.string "email"
    t.string "first_name"
    t.string "gender"
    t.string "last_name"
    t.string "phone"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["celula_id"], name: "index_members_on_celula_id"
    t.index ["choir_id"], name: "index_members_on_choir_id"
    t.index ["department_id"], name: "index_members_on_department_id"
  end

  create_table "news", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.boolean "published"
    t.datetime "published_at"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "pastors", force: :cascade do |t|
    t.text "biography"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.datetime "created_at", null: false
    t.date "date"
    t.text "description"
    t.string "status"
    t.string "time"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_schedules_on_activity_id"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.integer "role"
    t.datetime "updated_at", null: false
  end

  create_table "utilizadors", force: :cascade do |t|
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "nome"
    t.string "password_digest"
    t.integer "perfil"
    t.datetime "ultimo_login"
    t.datetime "updated_at", null: false
  end

  create_table "weddings", force: :cascade do |t|
    t.string "bride"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "groom"
    t.string "location"
    t.integer "pastor_id", null: false
    t.datetime "updated_at", null: false
    t.index ["pastor_id"], name: "index_weddings_on_pastor_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "area"
    t.integer "celula_id", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "function"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
    t.index ["celula_id"], name: "index_workers_on_celula_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "choirs"
  add_foreign_key "activities", "departments"
  add_foreign_key "appointments", "members"
  add_foreign_key "appointments", "pastors"
  add_foreign_key "baptisms", "pastors"
  add_foreign_key "celulas", "workers", column: "responsavel_id"
  add_foreign_key "members", "celulas"
  add_foreign_key "members", "choirs"
  add_foreign_key "members", "departments"
  add_foreign_key "news", "users"
  add_foreign_key "schedules", "activities"
  add_foreign_key "weddings", "pastors"
  add_foreign_key "workers", "celulas"
end
