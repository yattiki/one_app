class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render root_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if  @user.update(user_params)
      redirect_to root_path
    else
      render @user
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
    redirect_to root_path
    end
  end


  private
    def user_params
      params.require(:user).permit(:email,:password, :password_confirmation)
    end
end