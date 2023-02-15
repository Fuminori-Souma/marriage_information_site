class AddColumnPresent < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :present, :string
  end
end
