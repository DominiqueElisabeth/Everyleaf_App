class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, :unique => {:allow_blank => true}
  end
end
