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

ActiveRecord::Schema.define(version: 2021_06_17_172002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_visits", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.datetime "last_visit", default: "2021-06-19 18:57:09"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_chat_visits_on_chat_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "first_interlocutor_id", null: false
    t.bigint "second_interlocutor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_interlocutor_id"], name: "index_chats_on_first_interlocutor_id"
    t.index ["second_interlocutor_id"], name: "index_chats_on_second_interlocutor_id"
  end

  create_table "checks", force: :cascade do |t|
    t.decimal "sum", default: "0.0"
    t.integer "currency", default: 0
    t.string "customer", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_testing_homeworks", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.bigint "homework_testing_id", null: false
    t.string "answers", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_client_testing_homeworks_on_homework_id"
    t.index ["homework_testing_id"], name: "index_client_testing_homeworks_on_homework_testing_id"
  end

  create_table "client_word_homeworks", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.bigint "word_homework_id", null: false
    t.string "words", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_client_word_homeworks_on_homework_id"
    t.index ["word_homework_id"], name: "index_client_word_homeworks_on_word_homework_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id", null: false
    t.text "body", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", default: ""
    t.text "description", default: ""
    t.bigint "category_id", null: false
    t.bigint "teacher_id"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "done_homeworks", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "homework_id", null: false
    t.bigint "client_id", null: false
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_done_homeworks_on_client_id"
    t.index ["homework_id"], name: "index_done_homeworks_on_homework_id"
    t.index ["teacher_id"], name: "index_done_homeworks_on_teacher_id"
  end

  create_table "emails", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", default: ""
    t.text "body", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "file_homeworks", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.bigint "user_id", null: false
    t.string "files", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_file_homeworks_on_homework_id"
    t.index ["user_id"], name: "index_file_homeworks_on_user_id"
  end

  create_table "homework_testings", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_homework_testings_on_homework_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.text "text", default: ""
    t.datetime "time_to_complete", default: "2021-06-19 18:57:06"
    t.string "type", default: "common"
    t.string "category_of_work", default: "testing"
    t.boolean "has_score", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_homeworks_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.boolean "free", default: false
    t.text "text", default: ""
    t.string "video", default: ""
    t.string "files", default: ""
    t.string "name", default: ""
    t.decimal "price", default: "0.0"
    t.integer "currency", default: 0
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "chat_id", null: false
    t.text "body", default: ""
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "basket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_orders_on_basket_id"
    t.index ["lesson_id"], name: "index_orders_on_lesson_id"
  end

  create_table "paid_lessons", force: :cascade do |t|
    t.bigint "check_id", null: false
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_id"], name: "index_paid_lessons_on_check_id"
    t.index ["lesson_id"], name: "index_paid_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_paid_lessons_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "user_id", null: false
    t.text "body", default: ""
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "testing_questions", force: :cascade do |t|
    t.bigint "homework_testing_id", null: false
    t.text "body", default: ""
    t.string "answers", default: [], array: true
    t.string "correct_answers", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_testing_id"], name: "index_testing_questions_on_homework_testing_id"
  end

  create_table "tests_for_codes", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.string "tests", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_tests_for_codes_on_homework_id"
  end

  create_table "text_of_word_homeworks", force: :cascade do |t|
    t.bigint "word_homework_id", null: false
    t.text "text", default: ""
    t.string "code_lang", default: "common text"
    t.integer "positions_of_words", default: [], array: true
    t.string "title", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["word_homework_id"], name: "index_text_of_word_homeworks_on_word_homework_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "blocked", default: false
    t.integer "role", default: 1
    t.boolean "subscription", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "word_homeworks", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_word_homeworks_on_homework_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "baskets", "users"
  add_foreign_key "chat_visits", "chats"
  add_foreign_key "chats", "users", column: "first_interlocutor_id"
  add_foreign_key "chats", "users", column: "second_interlocutor_id"
  add_foreign_key "client_testing_homeworks", "homework_testings"
  add_foreign_key "client_testing_homeworks", "homeworks"
  add_foreign_key "client_word_homeworks", "homeworks"
  add_foreign_key "client_word_homeworks", "word_homeworks"
  add_foreign_key "comments", "questions"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "done_homeworks", "homeworks"
  add_foreign_key "done_homeworks", "users", column: "client_id"
  add_foreign_key "done_homeworks", "users", column: "teacher_id"
  add_foreign_key "emails", "users"
  add_foreign_key "file_homeworks", "homeworks"
  add_foreign_key "file_homeworks", "users"
  add_foreign_key "homework_testings", "homeworks"
  add_foreign_key "homeworks", "lessons"
  add_foreign_key "lessons", "courses"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "orders", "baskets"
  add_foreign_key "orders", "lessons"
  add_foreign_key "paid_lessons", "checks"
  add_foreign_key "paid_lessons", "lessons"
  add_foreign_key "paid_lessons", "users"
  add_foreign_key "questions", "lessons"
  add_foreign_key "questions", "users"
  add_foreign_key "testing_questions", "homework_testings"
  add_foreign_key "tests_for_codes", "homeworks"
  add_foreign_key "text_of_word_homeworks", "word_homeworks"
  add_foreign_key "word_homeworks", "homeworks"
end
