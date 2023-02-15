class ChangeDataBudgetToPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :budget, :string
  end
end
