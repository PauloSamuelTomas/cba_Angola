class AddActivityToSchedules < ActiveRecord::Migration[8.1]
  def change
    add_reference :schedules, :activity, null: false, foreign_key: true
  end
end
