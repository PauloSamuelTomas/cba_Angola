class CreateWorkers < ActiveRecord::Migration[8.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :function
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
