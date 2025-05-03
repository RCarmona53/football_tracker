class RenameLocationToRivalInMatches < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :location, :rival
  end
end
