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

ActiveRecord::Schema[8.0].define(version: 2025_06_07_053049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "competicaos", force: :cascade do |t|
    t.string "nome", null: false
    t.bigint "jogo_id", null: false
    t.date "data_inicio", null: false
    t.date "data_fim"
    t.string "formato", null: false
    t.string "status", default: "ABERTA"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jogo_id"], name: "index_competicaos_on_jogo_id"
  end

  create_table "jogos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.text "regras"
    t.integer "min_jogadores", null: false
    t.integer "max_jogadores", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competicaos", "jogos"
end
