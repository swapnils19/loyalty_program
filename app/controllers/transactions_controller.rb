class TransactionsController < ApplicationController
  before_action :set_user

  def index
    @transactions = @user.transactions.order(updated_at: :desc)
  end

  def create
    @transaction = @user.transactions.build(transaction_params)
    redirect_to @user and return if @transaction.save

    flash[:errors] = @transaction.errors.full_messages
    redirect_to new_user_transactions_path(@user)
  end

  def new
    @transaction = @user.transactions.build(amount: 0)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
