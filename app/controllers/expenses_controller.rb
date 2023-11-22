class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    @user = current_user
    @categories = Category.all
    @expense = Expense.new(expense_params)
    @expense.author = @user
    if @expense.save
      redirect_to category_path(@expense.category_id)
    else
      pp @expense.errors
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
