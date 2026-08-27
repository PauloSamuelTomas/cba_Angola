class AddUserToNews < ActiveRecord::Migration[8.1]
  def change
    add_reference :news, :user, null: false, foreign_key: true
  end
end
