class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @expenses = Expense.all
    @total = @expenses.sum(:amount)
    @category_totals = calculate_categories_totals
  end

  def show
    @category = Category.find_by(id: params[:id])
    @expenses = Expense.where(category_id: params[:id]).order(created_at: :desc)
    @total_for_category = @expenses.sum(:amount)
  end

  def new
    @category = Category.new
    @icons = ['&#x1F374;', '&#x2708;', '&#x1F393;', '&#x1F489;', '&#x1F697;', '&#x1F4A1;', '&#x1F3E0;', '&#x1F3A7;',
              '&#x1F6CD;', '&#x1F381;']
  end

  def create
    @icons = ['&#x1F374;', '&#x2708;', '&#x1F393;', '&#x1F489;', '&#x1F697;', '&#x1F4A1;', '&#x1F3E0;', '&#x1F3A7;',
              '&#x1F6CD;', '&#x1F381;']
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_path
    else
      pp @category.errors
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :category_id, :user_id)
  end

  def calculate_categories_totals
    category_totals = {}

    @categories.each do |category|
      category_expenses = @expenses.where(category_id: category.id)
      total = category_expenses.sum(:amount)
      category_totals[category.name] = total
    end

    category_totals
  end
end
