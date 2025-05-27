class MakeBudgetOptionalForExpenses < ActiveRecord::Migration[7.2]
  def change
    change_column_null :expenses, :budget_id, true
  end
end
