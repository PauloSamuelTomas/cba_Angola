class AddResponsavelToDepartments < ActiveRecord::Migration[8.1]
  def change
    add_column :departments, :responsavel, :string
  end
end
