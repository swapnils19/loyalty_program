class AuthController < ApplicationController
  def login
  end

  def signin
    @user = User.login(signin_params[:name])

    redirect_to user_path(@user) and return if @user

    flash.now[:error] = 'User does not exist. Please Signup!'
    render :login, status: :not_found
  end

  private

  def signin_params
    params.permit(:name)
  end
end
