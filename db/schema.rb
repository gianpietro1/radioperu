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

ActiveRecord::Schema.define(version: 20150628173614) do

  create_table "album_translations", force: :cascade do |t|
    t.integer  "album_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "review"
    t.string   "format"
  end

  add_index "album_translations", ["album_id"], name: "index_album_translations_on_album_id"
  add_index "album_translations", ["locale"], name: "index_album_translations_on_locale"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
  end

  create_table "albums_genres", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "album_id"
  end

  create_table "artist_translations", force: :cascade do |t|
    t.integer  "artist_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bio"
  end

  add_index "artist_translations", ["artist_id"], name: "index_artist_translations_on_artist_id"
  add_index "artist_translations", ["locale"], name: "index_artist_translations_on_locale"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "city"
    t.string   "url"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "artists_genres", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "artist_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_songs", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "song_id"
  end

  create_table "program_translations", force: :cascade do |t|
    t.integer  "program_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.string   "banner"
  end

  add_index "program_translations", ["locale"], name: "index_program_translations_on_locale"
  add_index "program_translations", ["program_id"], name: "index_program_translations_on_program_id"

  create_table "programs", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "user_id"
    t.string  "image"
    t.integer "radio_id"
    t.time    "program_start"
    t.time    "program_end"
    t.string  "banner"
    t.text    "days_array"
  end

  add_index "programs", ["radio_id"], name: "index_programs_on_radio_id"

  create_table "radio_translations", force: :cascade do |t|
    t.integer  "radio_id",    null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "radio_translations", ["locale"], name: "index_radio_translations_on_locale"
  add_index "radio_translations", ["radio_id"], name: "index_radio_translations_on_radio_id"

  create_table "radios", force: :cascade do |t|
    t.string   "player"
    t.string   "host"
    t.integer  "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_translations", force: :cascade do |t|
    t.integer  "song_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "review"
  end

  add_index "song_translations", ["locale"], name: "index_song_translations_on_locale"
  add_index "song_translations", ["song_id"], name: "index_song_translations_on_song_id"

  create_table "songs", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "discnum"
    t.integer  "track"
    t.string   "name"
    t.string   "filename"
    t.boolean  "id3",        default: false
    t.text     "lyrics"
    t.string   "video"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
