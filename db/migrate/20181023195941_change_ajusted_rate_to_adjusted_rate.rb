class ChangeAjustedRateToAdjustedRate < ActiveRecord::Migration[5.2]
  def change
  	rename_column :producers, :ajusted_rate, :adjusted_rate
  end
end
