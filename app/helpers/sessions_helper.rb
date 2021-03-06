module SessionsHelper
  #logea un usuario dado
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

# Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  #Metodo abreviado
  #if session[:user_id]
  #  @current_user ||= User.find_by(id: session[:user_id])
  #end

  def logged_in?
    !current_user.nil? #retorna true si hay un usuario logeado, sino false
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
