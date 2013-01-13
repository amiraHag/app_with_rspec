class CreateComplains < ActiveRecord::Migration
  def change
    create_table :complains do |t|
      t.string :subject
      t.string :detail
      t.string :solution
      t.integer :user_id

      t.timestamps
    end
  end
end
