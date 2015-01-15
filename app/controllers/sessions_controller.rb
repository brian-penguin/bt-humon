class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to root_path, notice: 'You have successfully logged in!'
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: 'You have successfully signed out!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
