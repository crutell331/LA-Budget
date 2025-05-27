class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :amount
  belongs_to :user
  belongs_to :budget, optional: true
  has_many :categories
end