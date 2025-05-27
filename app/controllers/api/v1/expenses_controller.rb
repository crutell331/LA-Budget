class Api::V1::ExpensesController < ApplicationController
  before_action :authorize
  before_action :set_expense, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @expenses = Expense.where(user_id: params[:user_id])
    elsif params[:budget_id]
      @expenses = Expense.where(budget_id: params[:budget_id])
    else
      @expenses = Expense.all
    end
    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user unless params[:user_id]
    
    if @expense.save
      if params[:category_ids]
        params[:category_ids].each do |category_id|
          ExpenseCategory.create(expense: @expense, category_id: category_id)
        end
      end
      render json: @expense, status: :created
    else
      render json: { errors: @expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      if params[:category_ids]
        @expense.expense_categories.destroy_all
        params[:category_ids].each do |category_id|
          ExpenseCategory.create(expense: @expense, category_id: category_id)
        end
      end
      render json: @expense
    else
      render json: { errors: @expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    head :no_content
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.permit(:name, :description, :amount, :user_id, :budget_id)
  end
end
