class UsersController < ApplicationController
  before_action :correct_post,only: [:edit]
  
  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end  
  end
  
  def correct_post
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

end