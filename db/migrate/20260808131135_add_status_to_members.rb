class AddStatusToMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :members, :status, :string, default: "Ativo", null: false
  end
end
