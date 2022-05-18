# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
