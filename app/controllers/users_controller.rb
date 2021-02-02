class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User successfully registered"
    else
      render 'new'
    end
  end

  def dashboard
   @myStories= Story.references(:users).where(user_id: params[:id])
   
  end
  
  def show
    @user = User.find(session[:user_id])
  end
  private

 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end