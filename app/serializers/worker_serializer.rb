class WorkerSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :function,
             :area,
             :phone,
             :email,
             :celula_id

  belongs_to :celula
end
