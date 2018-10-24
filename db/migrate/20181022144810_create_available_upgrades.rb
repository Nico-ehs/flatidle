class CreateAvailableUpgrades < ActiveRecord::Migration[5.2]
  def change
    create_table :available_upgrades do |t|
      t.integer :upgrade_id
      t.integer :game_id
      t.boolean :purchased

      t.timestamps
    end
  end
end
