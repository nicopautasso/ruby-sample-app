class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user #logea al usuario
        redirect_to user #redirecciona al perfil del usuario
      else
        flash.now[:danger] = 'Usuario y/o password invalidas' #crea un mensaje de error (se usa flash.now porque con flash al no hacer un request (render no cuenta como request) se queda el cartel un tiempo mas)
        render 'new' #vuelve a recargar el formulario
      end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
