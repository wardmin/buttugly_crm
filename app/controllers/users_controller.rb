class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to new_contact_path, notice: "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
  end

  def edit
  end

  def update 
    if @user.update(user_params) 
      redirect_to user_url, notice: "Profile updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to new_user_path, notice: "Sad to see you go. You can always sign up again."
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
