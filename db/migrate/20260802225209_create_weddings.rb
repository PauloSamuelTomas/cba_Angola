class CreateWeddings < ActiveRecord::Migration[8.1]
  def change
    create_table :weddings do |t|
      t.string :groom
      t.string :bride
      t.date :date
      t.string :location
      t.string :pastor

      t.timestamps
    end
  end
end
