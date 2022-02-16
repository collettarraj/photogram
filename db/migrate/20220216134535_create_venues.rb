class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :venuename
      t.string :address
      t.string :neighborhood

      t.timestamps
    end
  end
end
