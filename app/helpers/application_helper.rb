module ApplicationHelper

  def loggedin_autor?
    @loggedin_autor= Autor.find(session[:id_autor]) if session[:id_autor]
    not @loggedin_autor.nil?
  end
end
