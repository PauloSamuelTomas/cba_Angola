class AddPastorToWeddings < ActiveRecord::Migration[8.1]
  def change
    add_reference :weddings, :pastor, null: false, foreign_key: true
  end
end
