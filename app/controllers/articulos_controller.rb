class ArticulosController < ApplicationController
  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.where(:autor_id => session[:autor_id]).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articulos }
    end
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articulo }
    end
  end

  # GET /articulos/new
  # GET /articulos/new.json
  def new
    @articulo = Articulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @articulo }
    end
  end

  # GET /articulos/1/edit
  def edit
    @articulo = Articulo.find(params[:id])
    @comment_ids_before_edition = @articulo.comment_ids
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(params[:articulo])

    if session[:autor_id].nil?
      redirect_to login_path
    else  
      @articulo.autor_id= session[:autor_id]

      respond_to do |format|
        if @articulo.save
          format.html { redirect_to @articulo, notice: 'Articulo creado exitosamente' }
          format.json { render json: @articulo, status: :created, location: @articulo }
        else
          format.html { render action: "new" }
          format.json { render json: @articulo.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PUT /articulos/1
  # PUT /articulos/1.json
  def update
    @articulo = Articulo.find(params[:id])

		if (not params[:articulo][:comment_ids].nil?)
	    #apologies for the hack, couldnt find a better way to do it
	    comment_ids_after_edition = params[:comment_ids_before_edition].split.keep_if do |comment_id| (not params[:articulo][:comment_ids].include? comment_id)
    	end
	    params[:articulo][:comment_ids] = comment_ids_after_edition
		end
		
    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        format.html { redirect_to @articulo, notice: 'Articulo actualizado exitosamente' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to articulos_url }
      format.json { head :ok }
    end
  end

  
  def agregar_comentario
    @comentario = Comment.new(params[:comment])
    @comentario.articulo_id = params[:articulo_id]

    if @comentario.save
      redirect_to :controller => "home", :action => "show", :id => @comentario.articulo_id
    else
      redirect_to :back, :notice => "No se pudo agregar el comentario, el nombre y cuerpo deben ser completados" 
    end
  end

end
