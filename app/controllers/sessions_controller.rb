class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
      else
        flash.now[:danger] = 'Usuario y/o password invalidas' #crea un mensaje de error (se usa flash.now porque con flash al no hacer un request (render no cuenta como request) se queda el cartel un tiempo mas)
        render 'new' #vuelve a recargar el formulario
      end
  end

  def destroy
  end
end
