class CreateUpgradePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :upgrade_purchases do |t|
      t.integer :upgrade_id
      t.integer :game_id

      t.timestamps
    end
  end
end
