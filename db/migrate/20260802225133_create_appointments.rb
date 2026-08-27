class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :date
      t.string :time
      t.string :subject
      t.string :status

      t.timestamps
    end
  end
end
