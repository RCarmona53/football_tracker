class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :goals
      t.integer :assists
      t.decimal :rating
      t.boolean :present

      t.timestamps
    end
  end
end
