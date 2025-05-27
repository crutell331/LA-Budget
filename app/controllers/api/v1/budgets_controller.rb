class Api::V1::BudgetsController < ApplicationController
  before_action :authorize
  before_action :set_budget, only: [:show, :update, :destroy]

  def index
    @budgets = Budget.all
    render json: @budgets
  end

  def show
    render json: @budget
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      render json: @budget, status: :created
    else
      render json: { errors: @budget.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @budget.update(budget_params)
      render json: @budget
    else
      render json: { errors: @budget.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @budget.destroy
    head :no_content
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.permit(:budget_type, :monthly_allowance)
  end
end
