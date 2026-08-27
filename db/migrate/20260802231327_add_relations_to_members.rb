class AddRelationsToMembers < ActiveRecord::Migration[8.1]
  def change
    add_reference :members, :celula, foreign_key: true
    add_reference :members, :department, foreign_key: true
    add_reference :members, :choir, foreign_key: true
  end
end
