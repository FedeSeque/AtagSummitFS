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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120604153159) do

  create_table "articulos", :force => true do |t|
    t.string   "titulo"
    t.text     "cuerpo"
    t.integer  "autor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articulos_categories", :id => false, :force => true do |t|
    t.integer "articulo_id"
    t.integer "category_id"
  end

  create_table "autors", :force => true do |t|
    t.string   "usuario"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "comentador"
    t.text     "cuerpo"
    t.integer  "articulo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hits", :force => true do |t|
    t.integer  "articulo_id"
    t.integer  "autor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
