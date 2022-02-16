class AddUsersReferenceToUsersbests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :usersbests, :users, column: :users_id
    add_index :usersbests, :users_id
    change_column_null :usersbests, :users_id, false
  end
end
