class AddAreaAndCelulaToWorkers < ActiveRecord::Migration[8.1]
  def change
    add_column :workers, :area, :string
    add_reference :workers, :celula, null: false, foreign_key: true
  end
end
