class PastorSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :phone,
             :email,
             :biography

  has_many :appointments
  has_many :baptisms
  has_many :weddings
end
