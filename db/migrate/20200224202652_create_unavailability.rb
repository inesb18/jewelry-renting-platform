class CreateUnavailability < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailability do |t|
      t.date :starting_date
      t.date :end_date
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
