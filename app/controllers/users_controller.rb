class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
  end

  def create
    @user = User.new(user_params)
    redirect_to @user and return if @user.save

    render 'new'
  end

  def new
    @user = User.new
  end

  def show
    @total_loyalty_points = @user.loyalty_points&.sum(:points)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
