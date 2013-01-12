class Changetype < ActiveRecord::Migration
   def change
    change_table :users do |t|
  t.change :telephone, :string
end
    end    
end