class AddResponsavelToCelulas < ActiveRecord::Migration[8.1]
  def change
    add_reference :celulas,
                  :responsavel,
                  foreign_key: {
                    to_table: :workers
                  },
                  null: true
  end
end
