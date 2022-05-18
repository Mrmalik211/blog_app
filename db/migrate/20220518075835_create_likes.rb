# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
