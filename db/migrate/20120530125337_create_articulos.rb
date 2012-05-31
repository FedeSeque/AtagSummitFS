class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :cuerpo
      t.integer :id_autor

      t.timestamps
    end
  end
end
