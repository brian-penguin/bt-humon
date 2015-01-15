class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path, notice: 'You have successfully logged in!'
    else
      render :new, notice: 'Invalid log in credentials'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, device_token: nil)
  end
end
