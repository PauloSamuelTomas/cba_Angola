class CreateNews < ActiveRecord::Migration[8.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
