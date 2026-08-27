class AddRelationsToBaptisms < ActiveRecord::Migration[8.1]
  def change
    add_reference :baptisms, :member, null: false, foreign_key: true
    add_reference :baptisms, :pastor, null: false, foreign_key: true
  end
end
