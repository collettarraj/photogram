class AddDishesReferenceToUsersbests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :usersbests, :dishes, column: :dishes_id
    add_index :usersbests, :dishes_id
    change_column_null :usersbests, :dishes_id, false
  end
end
