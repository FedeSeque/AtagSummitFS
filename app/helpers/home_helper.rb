module HomeHelper

  def get_formatted_autor articulo
    @autor = Autor.find(articulo.id_autor) if articulo.id_autor
    "por #{@autor.nombre} #{@autor.apellido}"
  end

end
