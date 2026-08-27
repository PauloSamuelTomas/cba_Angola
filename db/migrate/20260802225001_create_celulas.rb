class CreateCelulas < ActiveRecord::Migration[8.1]
  def change
    create_table :celulas do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
