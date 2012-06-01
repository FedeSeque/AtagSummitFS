class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comentador
      t.text :cuerpo
      t.integer :articulo_id

      t.timestamps
    end
  end
end
