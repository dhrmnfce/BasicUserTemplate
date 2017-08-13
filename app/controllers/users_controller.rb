class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully signed up, welcome to TenantNest!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User successfully deleted."
    redirect_to users_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before Filters
    
    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
    
    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) && flash[:danger] = "Access denied." unless current_user?(@user)
    end
    
    # Confirms an admin user
    def admin_user
      redirect_to(current_user) unless current_user.admin?
    end
  
end
