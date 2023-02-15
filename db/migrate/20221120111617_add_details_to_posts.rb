class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :budget, :integer
    add_column :posts, :place, :string
    add_column :posts, :time, :string
    add_column :posts, :season, :string
    add_column :posts, :WhatSaid, :string
    add_column :posts, :Comment, :string
  end
end
