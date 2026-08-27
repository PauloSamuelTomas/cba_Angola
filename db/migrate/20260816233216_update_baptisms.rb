class UpdateBaptisms < ActiveRecord::Migration[8.1]
  def change
    remove_reference :baptisms, :member, foreign_key: true
  end
end
