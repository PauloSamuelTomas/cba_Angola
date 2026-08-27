class Worker < ApplicationRecord
  belongs_to :celula

  has_one :celula_responsavel,
          class_name: "Celula",
          foreign_key: :responsavel_id
end
