class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :budget, optional: true
  has_many :expense_categories, dependent: :destroy
  has_many :categories, through: :expense_categories
  
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
