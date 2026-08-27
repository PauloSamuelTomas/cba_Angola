class CreateChoirs < ActiveRecord::Migration[8.1]
  def change
    create_table :choirs do |t|
      t.string :name
      t.text :description
      t.string :leader

      t.timestamps
    end
  end
end
