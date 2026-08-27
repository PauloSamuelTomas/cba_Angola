class ChoirSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description,
             :leader
  has_many :members
end
