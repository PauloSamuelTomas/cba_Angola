class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
