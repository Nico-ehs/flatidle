class CreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      t.string :name
      t.integer :amount
      t.float :base_rate
      t.integer :price
      t.integer :game_id

      t.timestamps
    end
  end
end
