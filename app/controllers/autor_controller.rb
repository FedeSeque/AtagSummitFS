class AutorController < ApplicationController

  # GET /autores/1
  # GET /autores/1.json
  def show
    @autor = Autor.find(params[:id])

    respond_to do |format|
      format.html # show_autor.html.erb
      format.json { render json: @autor }
    end
  end
  
end
