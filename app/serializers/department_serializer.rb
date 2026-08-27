class DepartmentSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :responsavel,
             :description

  has_many :members
end
