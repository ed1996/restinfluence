class AddFieldsToResaForReservation < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :restorer, foreign_key: true
  end
end
