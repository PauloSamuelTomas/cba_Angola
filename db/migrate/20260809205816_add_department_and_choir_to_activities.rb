class AddDepartmentAndChoirToActivities < ActiveRecord::Migration[8.1]
  def change
    add_reference :activities, :department, foreign_key: true
    add_reference :activities, :choir, foreign_key: true
  end
end
