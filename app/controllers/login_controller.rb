class LoginController < ApplicationController

  def registro
    @autor= Autor.new
  end

  def ingreso
    @autor= Autor.find_by_usuario params[:usuario]
    if @autor.nil?
      redirect_to login_path, :notice => "Usuario no encontrado!"
    else
      session[:id_autor] =@autor.id
      redirect_to root_path
    end
  end

  def registrar
    @autor= Autor.new(params[:autor])
    if @autor.save
      redirect_to login_path
    else
      redirect_to registro_path, :notice => "No es posible registrarse. Campos Usuario y Nombre obligatorios, o el Usuario escogido ya no esta disponible"
    end
  end

  def salir
    session[:id_autor]=nil
    redirect_to root_path
  end

end
