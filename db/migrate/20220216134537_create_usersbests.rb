class CreateUsersbests < ActiveRecord::Migration[6.0]
  def change
    create_table :usersbests do |t|
      t.integer :dishes_id
      t.integer :venue_id
      t.integer :users_id

      t.timestamps
    end
  end
end
