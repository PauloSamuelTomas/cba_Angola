class RemoveMemberAndPastorFromBaptisms < ActiveRecord::Migration[8.1]
  def change
    remove_column :baptisms, :member, :string
    remove_column :baptisms, :pastor, :string
  end
end
