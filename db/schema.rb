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

ActiveRecord::Schema[7.0].define(version: 2023_04_18_173654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "reception_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "treatment_id"
    t.index ["appointment_id"], name: "index_notes_on_appointment_id"
    t.index ["treatment_id"], name: "index_notes_on_treatment_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "patient_contacts", force: :cascade do |t|
    t.string "name"
    t.bigint "patient_id", null: false
    t.boolean "primary"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "contact_method"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_contacts_on_patient_id"
  end

  create_table "patient_pharmacies", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "pharmacy_id", null: false
    t.boolean "preferred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_pharmacies_on_patient_id"
    t.index ["pharmacy_id"], name: "index_patient_pharmacies_on_pharmacy_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name"
    t.date "dob"
    t.bigint "user_id"
    t.string "gender"
    t.string "health_card"
    t.string "version_code"
    t.datetime "archived_at"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "dosage"
    t.string "frequency"
    t.bigint "treatment_id"
    t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
    t.index ["treatment_id"], name: "index_prescriptions_on_treatment_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.bigint "diagnosis_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.bigint "appointment_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_treatments_on_appointment_id"
    t.index ["diagnosis_id"], name: "index_treatments_on_diagnosis_id"
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "users"
  add_foreign_key "notes", "appointments"
  add_foreign_key "notes", "treatments"
  add_foreign_key "notes", "users"
  add_foreign_key "patient_contacts", "patients"
  add_foreign_key "patient_pharmacies", "patients"
  add_foreign_key "patient_pharmacies", "pharmacies"
  add_foreign_key "patients", "users"
  add_foreign_key "prescriptions", "appointments"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "prescriptions", "treatments"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "treatments", "appointments"
  add_foreign_key "treatments", "diagnoses"
  add_foreign_key "treatments", "patients"
  add_foreign_key "treatments", "users"
end
