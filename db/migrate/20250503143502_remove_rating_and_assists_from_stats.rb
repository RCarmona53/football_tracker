class RemoveRatingAndAssistsFromStats < ActiveRecord::Migration[7.0]
  def change
    remove_column :stats, :rating, :decimal
    remove_column :stats, :assists, :integer
  end
end
