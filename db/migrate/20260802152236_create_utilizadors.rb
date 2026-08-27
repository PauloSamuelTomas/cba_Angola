class CreateUtilizadors < ActiveRecord::Migration[8.1]
  def change
    create_table :utilizadors do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.integer :perfil
      t.boolean :activo
      t.datetime :ultimo_login

      t.timestamps
    end
  end
end
