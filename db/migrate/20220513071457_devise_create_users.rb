# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# rubocop:disable Metrics/MethodLength
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.boolean :is_admin, default: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
# rubocop:enable Metrics/MethodLength
