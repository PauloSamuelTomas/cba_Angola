class WeddingSerializer < ActiveModel::Serializer
  attributes :id,
             :groom,
             :bride,
             :date
  belongs_to :pastor
end
