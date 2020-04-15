class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:show, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcomme to the Alpha Blog #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    
  end
  def update
    
    if @user.update(user_params)
      flash[:success] = "Your Account was succesfully updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def show
    
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def destroys
    @user.destroy
    redirect_to root_path
    flash[:notice] = "User #{@user.username} was succesfully deleted"
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def require_same_user
    if current_user != @user
      flash[:danger] = "You have not the rights to access this users area"
      redirect_to root_path
    end
  end
end