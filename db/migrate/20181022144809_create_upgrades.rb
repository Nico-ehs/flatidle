class CreateUpgrades < ActiveRecord::Migration[5.2]
  def change
    create_table :upgrades do |t|
      t.string :name
      t.integer :price
      t.string :function_name

      t.timestamps
    end
  end
end
