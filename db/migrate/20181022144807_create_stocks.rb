class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :resource_name
      t.integer :amount
      t.integer :game_id

      t.timestamps
    end
  end
end
