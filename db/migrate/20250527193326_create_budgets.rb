class CreateBudgets < ActiveRecord::Migration[7.2]
  def change
    create_table :budgets do |t|
      t.string :budget_type
      t.float :monthly_allowance

      t.timestamps
    end
  end
end
