# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
ExpenseCategory.destroy_all
Expense.destroy_all
Category.destroy_all
Budget.destroy_all
User.destroy_all

# Create Users
user1 = User.create!(name: "John Doe", username: "johndoe", password: "password")
user2 = User.create!(name: "Jane Smith", username: "janesmith", password: "password")

# Create Budgets
budget1 = Budget.create!(budget_type: "Monthly", monthly_allowance: 1000.00)
budget2 = Budget.create!(budget_type: "Weekly", monthly_allowance: 250.00)

# Create Categories
groceries = Category.create!(name: "Groceries")
utilities = Category.create!(name: "Utilities")
entertainment = Category.create!(name: "Entertainment")
transportation = Category.create!(name: "Transportation")
dining = Category.create!(name: "Dining Out")

# Create Expenses
expense1 = Expense.create!(
  name: "Grocery Shopping",
  description: "Weekly grocery shopping at Trader Joe's",
  amount: 75.50,
  user: user1,
  budget: budget1
)

expense2 = Expense.create!(
  name: "Electric Bill",
  description: "Monthly electric bill",
  amount: 120.00,
  user: user1,
  budget: budget1
)

expense3 = Expense.create!(
  name: "Movie Night",
  description: "Tickets and snacks",
  amount: 35.00,
  user: user2,
  budget: budget2
)

expense4 = Expense.create!(
  name: "Gas",
  description: "Filled up the car",
  amount: 45.00,
  user: user2,
  budget: nil
)

# Create ExpenseCategories
ExpenseCategory.create!(expense: expense1, category: groceries)
ExpenseCategory.create!(expense: expense2, category: utilities)
ExpenseCategory.create!(expense: expense3, category: entertainment)
ExpenseCategory.create!(expense: expense4, category: transportation)

puts "Seed data created successfully!"
