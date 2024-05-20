class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :gas_type
      t.decimal :autonomy, :refuel_time, :refuel_cost
      t.boolean :is_modified
      t.timestamps
    end
  end
end