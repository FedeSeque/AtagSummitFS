module ApplicationHelper

  def loggedin_autor?
    @loggedin_autor= Autor.find(session[:autor_id]) if session[:autor_id]
    not @loggedin_autor.nil?
  end
end
