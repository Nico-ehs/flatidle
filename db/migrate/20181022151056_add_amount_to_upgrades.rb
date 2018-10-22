class AddAmountToUpgrades < ActiveRecord::Migration[5.2]
  def change
    add_column :upgrades, :amount, :integer
  end
end
