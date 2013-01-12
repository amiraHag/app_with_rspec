class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :users, :telephone, unique: true
  end
end
