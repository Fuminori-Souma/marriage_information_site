class RenameContentColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :content, :title
  end
end
