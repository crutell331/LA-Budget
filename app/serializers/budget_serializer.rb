class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :budget_type, :monthly_allowance
  has_many :expenses
end