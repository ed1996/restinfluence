class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :restaurant, foreign_key: true
      t.references :restorer, foreign_key: true
      t.datetime :start_date
      t.string :time
      t.string :people

      t.timestamps
    end
  end
end
