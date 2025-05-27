class Budget < ApplicationRecord
  has_many :expenses, dependent: :nullify
  
  validates :budget_type, presence: true
  validates :monthly_allowance, presence: true, numericality: { greater_than: 0 }
end
