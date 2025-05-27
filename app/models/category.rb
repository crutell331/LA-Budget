class Category < ApplicationRecord
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories
  
  validates :name, presence: true, uniqueness: true
end
