class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :carmodel
      t.string :price
      t.string :myear
      t.string :uyear
      t.string :cartype
      t.integer :user_id

      t.timestamps
    end
  end
end
