class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
  end

  def edit
  end

  def update
  	if @user.update user_params
      redirect_to @user, notice: "Profile was successfully updated."
    else
      render 'edit'
    end
  end

  def show
  end

  private
  def find_user
    @user = User.find(params[:id])
  end 
  def user_params
    params.require(:user).permit(:email, :about)
  end

end
