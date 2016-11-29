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

ActiveRecord::Schema.define(version: 20161126024421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aposta", force: :cascade do |t|
    t.integer  "idSala"
    t.integer  "idUser"
    t.string   "palpite"
    t.boolean  "vencedor"
    t.integer  "status"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "bets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url_photo"
    t.string   "category"
    t.integer  "room_status"
    t.integer  "room_type"
    t.integer  "stake"
    t.date     "final_date"
    t.string   "final_answer"
    t.string   "answer_type"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
    t.integer  "usuario_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    :index=>{:name=>"index_conversations_on_sender_id", :using=>:btree}
    t.integer  "recipient_id", :index=>{:name=>"index_conversations_on_recipient_id", :using=>:btree}
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

  create_table "dialogos", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

  create_table "guesses", force: :cascade do |t|
    t.integer  "bet_id"
    t.integer  "usuario_id"
    t.boolean  "won_status"
    t.string   "guess_text"
    t.integer  "guess_status"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "id_bet"
    t.integer  "id_user"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "mensagems", force: :cascade do |t|
    t.text     "body"
    t.integer  "usuario_id", :index=>{:name=>"index_mensagems_on_usuario_id", :using=>:btree}
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "usuario_id", :index=>{:name=>"index_messages_on_usuario_id", :using=>:btree}
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at",      :null=>false
    t.datetime "update_at"
    t.datetime "updated_at",      :null=>false
  end

  create_table "salas", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "idOwner"
    t.integer  "sala_type"
    t.string   "reward"
    t.integer  "stake"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
    t.string   "foto"
    t.string   "categoria"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "access_token"
    t.string   "uid"
    t.string   "photo_url"
    t.string   "provider"
    t.boolean  "status"
    t.string   "reason"
    t.string   "user_type"
    t.date     "data_ingresso"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "mensagems", "usuarios"
  add_foreign_key "messages", "usuarios"
end
