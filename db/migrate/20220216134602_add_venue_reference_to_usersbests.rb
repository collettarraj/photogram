class AddVenueReferenceToUsersbests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :usersbests, :venues
    add_index :usersbests, :venue_id
    change_column_null :usersbests, :venue_id, false
  end
end
