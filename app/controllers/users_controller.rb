class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Perfil actualizado correctamente"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Usted se ha registrado correctamente!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario correctamente eliminado"
    redirect_to users_url
  end

before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
before_action :admin_user, only: :destroy

private
  def user_params
    #el .permit se utiliza como strong parameters, para no permitir que se modifiquen otros que no sean los especificados
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #confirma que el usuario este logeado
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Debe ingresar antes de seguir"
      redirect_to login_url
    end
  end

  #chequea que el usuario logeado sea el correcto
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end

  #confirma que un usuario sea administrador
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
