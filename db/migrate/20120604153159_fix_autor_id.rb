class FixAutorId < ActiveRecord::Migration

  def change
    rename_column :articulos, :id_autor, :autor_id
  end

end
