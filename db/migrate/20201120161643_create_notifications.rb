class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :state
      t.integer :typing

      t.timestamps
    end
  end
end
