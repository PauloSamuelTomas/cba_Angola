class BaptismSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :phone,
             :email,
             :birth_date,
             :date,
             :location,
             :status,
             :pastor_id

  belongs_to :pastor
end
