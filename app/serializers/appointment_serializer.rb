class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :phone,
             :date,
             :time,
             :subject,
             :status,
             :member_id,
             :pastor_id

  belongs_to :member
  belongs_to :pastor
end
