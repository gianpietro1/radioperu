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

ActiveRecord::Schema.define(version: 20160525221901) do

  create_table "album_playstats", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "listened_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "album_playstats", ["song_id"], name: "index_album_playstats_on_song_id"

  create_table "album_translations", force: :cascade do |t|
    t.integer  "album_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "review"
  end

  add_index "album_translations", ["album_id"], name: "index_album_translations_on_album_id"
  add_index "album_translations", ["locale"], name: "index_album_translations_on_locale"

  create_table "album_viewstats", force: :cascade do |t|
    t.integer  "album_id"
    t.datetime "viewed_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "album_viewstats", ["album_id"], name: "index_album_viewstats_on_album_id"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.integer  "format_id"
    t.integer  "user_id"
    t.string   "slug"
    t.string   "buylink"
  end

  add_index "albums", ["slug"], name: "index_albums_on_slug"

  create_table "artist_translations", force: :cascade do |t|
    t.integer  "artist_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bio"
  end

  add_index "artist_translations", ["artist_id"], name: "index_artist_translations_on_artist_id"
  add_index "artist_translations", ["locale"], name: "index_artist_translations_on_locale"

  create_table "artist_viewstats", force: :cascade do |t|
    t.integer  "artist_id"
    t.datetime "viewed_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "artist_viewstats", ["artist_id"], name: "index_artist_viewstats_on_artist_id"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "city"
    t.string   "external_url"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "genre_id"
    t.integer  "user_id"
    t.string   "slug"
    t.string   "social_fb"
  end

  add_index "artists", ["slug"], name: "index_artists_on_slug"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "ancestry"
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry"
  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "format_translations", force: :cascade do |t|
    t.integer  "format_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "format_translations", ["format_id"], name: "index_format_translations_on_format_id"
  add_index "format_translations", ["locale"], name: "index_format_translations_on_locale"

  create_table "formats", force: :cascade do |t|
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "genre_translations", force: :cascade do |t|
    t.integer  "genre_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "genre_translations", ["genre_id"], name: "index_genre_translations_on_genre_id"
  add_index "genre_translations", ["locale"], name: "index_genre_translations_on_locale"

  create_table "genres", force: :cascade do |t|
    t.integer "radio_id"
  end

  create_table "playlist_playstats", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "listened_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "playlist_playstats", ["song_id"], name: "index_playlist_playstats_on_song_id"

  create_table "playlist_songs", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "playlist_viewstats", force: :cascade do |t|
    t.integer  "playlist_id"
    t.datetime "viewed_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "playlist_viewstats", ["playlist_id"], name: "index_playlist_viewstats_on_playlist_id"

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image"
    t.text     "description"
    t.boolean  "private",     default: false
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
    t.string  "banner_android"
    t.string  "banner_iphone"
    t.string  "banner_ipad"
    t.string  "banner_link"
  end

  add_index "programs", ["radio_id"], name: "index_programs_on_radio_id"

  create_table "radio_playstats", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "listened_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "radio_playstats", ["song_id"], name: "index_radio_playstats_on_song_id"

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
    t.string   "color"
  end

  create_table "song_playstats", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "listened_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "song_playstats", ["song_id"], name: "index_song_playstats_on_song_id"

  create_table "song_translations", force: :cascade do |t|
    t.integer  "song_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "review"
  end

  add_index "song_translations", ["locale"], name: "index_song_translations_on_locale"
  add_index "song_translations", ["song_id"], name: "index_song_translations_on_song_id"

  create_table "song_viewstats", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "viewed_at"
    t.string   "ip_address"
    t.string   "platform"
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
  end

  add_index "song_viewstats", ["song_id"], name: "index_song_viewstats_on_song_id"

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
    t.integer  "genre_id"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "songs", ["slug"], name: "index_songs_on_slug"

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
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
    t.string   "role",                   default: "listener"
    t.string   "provider"
    t.string   "uid"
    t.string   "auth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
