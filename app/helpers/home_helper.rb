module HomeHelper

  def get_autor articulo
    @autor = Autor.find(articulo.autor_id) if articulo.autor_id
    "#{@autor.nombre} #{@autor.apellido}"
  end
  
  def get_autor_id articulo
    @autor = Autor.find(articulo.autor_id) if articulo.autor_id
    @autor.id
  end

end
