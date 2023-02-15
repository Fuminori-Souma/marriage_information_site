class RenameWhatSaidColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :WhatSaid, :whatsaid
    rename_column :posts, :Comment, :comment
  end
end
