class AddGenderAndAddressToBaptisms < ActiveRecord::Migration[8.1]
  def change
    add_column :baptisms, :gender, :string
    add_column :baptisms, :address, :string
  end
end
