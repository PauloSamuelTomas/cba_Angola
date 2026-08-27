class CelulaSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description
  has_many :members
end
