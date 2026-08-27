class AddRelationsToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_reference :appointments, :member, null: false, foreign_key: true
    add_reference :appointments, :pastor, null: false, foreign_key: true
  end
end
