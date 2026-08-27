class CreateBaptisms < ActiveRecord::Migration[8.1]
  def change
    create_table :baptisms do |t|
      t.string :member
      t.date :date
      t.string :location
      t.string :pastor

      t.timestamps
    end
  end
end
