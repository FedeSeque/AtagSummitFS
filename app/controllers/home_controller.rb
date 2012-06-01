class HomeController < ApplicationController
  def index
    @articulos= Articulo.order("created_at DESC")
  end

  def show
    @articulo = Articulo.find(params[:id])
    @comentario = Comment.new

    guardar_hit params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articulo }
    end
  end

  private
  def guardar_hit articulo_id
  #author_id equals 0 means a hit from a guest
  @hit = Hit.new(:articulo_id => articulo_id, :autor_id => 0)
  @hit.autor_id = session[:autor_id] if session[:autor_id]
  @hit.save
  end


end
