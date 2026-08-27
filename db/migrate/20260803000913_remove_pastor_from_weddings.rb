class RemovePastorFromWeddings < ActiveRecord::Migration[8.1]
  def change
    remove_column :weddings, :pastor, :string
  end
end
