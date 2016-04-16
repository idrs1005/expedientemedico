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

ActiveRecord::Schema.define(version: 20160401155440) do

  create_table "tbl_Medico", primary_key: "ID_Medico", force: :cascade do |t|
    t.string  "Codigo_Licencia", limit: 20
    t.integer "Validado",        limit: 4
    t.integer "ID_Persona",      limit: 4
  end

  add_index "tbl_Medico", ["Codigo_Licencia"], name: "Codigo_Licencia", unique: true, using: :btree
  add_index "tbl_Medico", ["ID_Persona"], name: "R_16", using: :btree

  create_table "tbl_Persona", primary_key: "ID_Persona", force: :cascade do |t|
    t.binary  "Foto_Perfil",      limit: 65535
    t.string  "Nombre",           limit: 20,    null: false
    t.string  "Apellido1",        limit: 18,    null: false
    t.string  "Apellido2",        limit: 20
    t.integer "Identificacion",   limit: 4,     null: false
    t.date    "Fecha_Nacimiento"
    t.integer "Sexo",             limit: 4
    t.string  "Usuario",          limit: 20,    null: false
    t.string  "Correo",           limit: 60,    null: false
    t.integer "Tipo",             limit: 4
    t.integer "Validado",         limit: 4
    t.string  "password_digest",  limit: 255
  end

  add_index "tbl_Persona", ["Correo"], name: "Correo", unique: true, using: :btree
  add_index "tbl_Persona", ["Identificacion"], name: "Identificacion", unique: true, using: :btree

  add_foreign_key "tbl_Medico", "tbl_Persona", column: "ID_Persona", primary_key: "ID_Persona", name: "tbl_Medico_ibfk_1"
end
