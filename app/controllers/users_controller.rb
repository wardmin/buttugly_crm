class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:show, :edit, :update, :destroy]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to contacts_url, notice: "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
  end

  def edit
  end

  def update  
    redirect_to user_url
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
