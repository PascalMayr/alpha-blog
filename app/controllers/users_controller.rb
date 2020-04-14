class UsersController < ApplicationController
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
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your Account was succesfully updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
    flash[:notice] = "User #{@user.username} was succesfully deleted"
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end