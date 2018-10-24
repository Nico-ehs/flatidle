class AddBasePriceAndGrowthRateToProducers < ActiveRecord::Migration[5.2]
  def change
  	add_column :producers, :base_price, :integer
  	add_column :producers, :growth_rate, :float
  end
end
