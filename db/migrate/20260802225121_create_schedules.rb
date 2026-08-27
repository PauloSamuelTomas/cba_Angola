class CreateSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :time
      t.string :status

      t.timestamps
    end
  end
end
