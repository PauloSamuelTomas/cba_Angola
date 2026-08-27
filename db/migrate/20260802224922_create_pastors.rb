class CreatePastors < ActiveRecord::Migration[8.1]
  def change
    create_table :pastors do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :biography

      t.timestamps
    end
  end
end
