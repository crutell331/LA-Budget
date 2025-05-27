class Api::V1::ExpenseCategoriesController < ApplicationController
  before_action :authorize
  before_action :set_expense_category, only: [:show, :update, :destroy]

  def index
    if params[:expense_id]
      @expense_categories = ExpenseCategory.where(expense_id: params[:expense_id])
    elsif params[:category_id]
      @expense_categories = ExpenseCategory.where(category_id: params[:category_id])
    else
      @expense_categories = ExpenseCategory.all
    end
    render json: @expense_categories
  end

  def show
    render json: @expense_category
  end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    if @expense_category.save
      render json: @expense_category, status: :created
    else
      render json: { errors: @expense_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @expense_category.update(expense_category_params)
      render json: @expense_category
    else
      render json: { errors: @expense_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @expense_category.destroy
    head :no_content
  end

  private

  def set_expense_category
    @expense_category = ExpenseCategory.find(params[:id])
  end

  def expense_category_params
    params.permit(:expense_id, :category_id)
  end
end
