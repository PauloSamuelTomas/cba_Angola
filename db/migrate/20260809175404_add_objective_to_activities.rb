class AddObjectiveToActivities < ActiveRecord::Migration[8.1]
  def change
    add_column :activities, :objective, :text
  end
end
