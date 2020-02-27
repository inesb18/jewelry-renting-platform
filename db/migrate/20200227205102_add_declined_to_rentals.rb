class AddDeclinedToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :declined, :boolean, default: false
  end
end
